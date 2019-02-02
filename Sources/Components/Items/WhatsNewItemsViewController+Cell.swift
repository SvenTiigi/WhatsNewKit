//
//  WhatsNewItemsViewController+Cell.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 02.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Cell

extension WhatsNewItemsViewController {
    
    /// The Cell
    class Cell: UITableViewCell {
        
        // MARK: Properties
        
        /// The Item
        let item: WhatsNew.Item
        
        /// The Configuration
        let configuration: WhatsNewViewController.Configuration
        
        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - item: The WhatsNew Item
        ///   - configuration: The Configuration
        init(item: WhatsNew.Item,
             configuration: WhatsNewViewController.Configuration) {
            // Set item
            self.item = item
            // Set configuration
            self.configuration = configuration
            // Super init default style
            super.init(
                style: .default,
                reuseIdentifier: String(describing: Cell.self)
            )
            // Set background color
            self.contentView.backgroundColor = self.configuration.backgroundColor
            // Check if ItemsView Layout is default
            if self.configuration.itemsView.layout == .default {
                // Perform ImageView Configuration
                self.configureImageView()
            }
            // Perform TextLabel Configuration
            self.configureTextLabel()
        }
        
        /// Initializer with Coder always returns nil
        required init?(coder aDecoder: NSCoder) {
            return nil
        }
        
    }
    
}

// MARK: - Configure TextLabel

extension WhatsNewItemsViewController.Cell {
    
    /// Configure TextLabel
    func configureTextLabel() {
        // Set font
        self.textLabel?.font = self.configuration.itemsView.subtitleFont
        // Set textcolor
        self.textLabel?.textColor = self.configuration.itemsView.subtitleColor
        // Set number of lines to zero
        self.textLabel?.numberOfLines = 0
        // Set linebreak mode to word wrapping
        self.textLabel?.lineBreakMode = .byWordWrapping
        // Set attributed text
        self.textLabel?.attributedText = self.makeAttributedTextString()
        // Set white background color
        self.backgroundColor = .white
        // Check if Layout is centered
        if self.configuration.itemsView.layout == .centered {
            // Set centered Text
            self.textLabel?.textAlignment = .center
        }
    }
    
}

// MARK: - Configure ImageView

extension WhatsNewItemsViewController.Cell {
    
    /// Configure ImageView
    func configureImageView() {
        // Enable scale aspect fit
        self.imageView?.contentMode = .scaleAspectFit
        // Clip to Bounds
        self.imageView?.clipsToBounds = true
        // Initialize Image from Item
        var image = self.item.image
        // Declare scale factor
        let scaleFactor: CGFloat?
        // Switch on ImageSize
        switch self.configuration.itemsView.imageSize {
        case .original:
            // No scale factor
            scaleFactor = nil
        case .preferred:
            // Preferred scale factor 25
            scaleFactor = 25
        case .fixed(let height):
            // Initialize scale factor with fixed height
            scaleFactor = .init(height)
        }
        // Check if a scale factor is available
        if let scaleFactor = scaleFactor,
            let cgImage = image?.cgImage,
            let size = image?.size,
            let imageOrientation = image?.imageOrientation {
            // Re-Initialize Image with scaled CGImage
            image = .init(
                cgImage: cgImage,
                scale: size.height / scaleFactor,
                orientation: imageOrientation
            )
        }
        // Check if autoTintImage is activated
        if self.configuration.itemsView.autoTintImage {
            // Set template tinted image
            let templateImage = image?.withRenderingMode(.alwaysTemplate)
            self.imageView?.image = templateImage
            self.imageView?.tintColor = self.configuration.tintColor
        } else {
            // Set original image
            self.imageView?.image = image
        }
    }
    
}

// MARK: - Make AttributedString

extension WhatsNewItemsViewController.Cell {
    
    /// Naje AttributedString Text String
    ///
    /// - Returns: The Attributed String
    func makeAttributedTextString() -> NSAttributedString {
        // Declare Title Subtitle Attributed String
        let titleSubtitleAttributedString: NSMutableAttributedString
        // Check if title is empty
        if self.item.title.isEmpty {
            // Just return the item subtitle has no title is available
            titleSubtitleAttributedString = .init(string: self.item.subtitle)
        } else {
            // Initialize attributed string
            titleSubtitleAttributedString = .init(string: "\(self.item.title)\n\(self.item.subtitle)")
            // Add title font
            titleSubtitleAttributedString.addAttributes(
                [.font: self.configuration.itemsView.titleFont],
                range: NSRange(location: 0, length: self.item.title.count)
            )
            // Add title color
            titleSubtitleAttributedString.addAttributes(
                [.foregroundColor: self.configuration.itemsView.titleColor],
                range: NSRange(location: 0, length: self.item.title.count)
            )
        }
        // Check if Layout is centered
        if self.configuration.itemsView.layout == .centered {
            // Initialize a Textattachment
            let attachment = NSTextAttachment()
            // Set Attachment Image
            attachment.image = self.item.image
            // Check if ItemsView should auto tint image
            if self.configuration.itemsView.autoTintImage,
                let tintedImage = attachment.image?.tint(color: self.configuration.tintColor) {
                // Set tinted image
                attachment.image = tintedImage
            }
            // Add Line Break at first position to TitleSubtitle String to create a spacing between Image and Text
            titleSubtitleAttributedString.insert(.init(string: "\n\n"), at: 0)
            // Initialize Attachment String
            let attachmentString = NSAttributedString(attachment: attachment)
            // Insert Attachment String at first position
            titleSubtitleAttributedString.insert(attachmentString, at: 0)
        }
        // Return TitleSubtitle String
        return titleSubtitleAttributedString
    }
    
}

// MARK: - UIImage+Tint

private extension UIImage {
    
    /// Tint Image with Color
    ///
    /// - Parameter color: The Color
    /// - Returns: The tinted UIImage
    func tint(color: UIColor) -> UIImage? {
        let image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.set()
        image.draw(in: CGRect(origin: .zero, size: self.size))
        guard let tintedImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return tintedImage
    }
    
}
