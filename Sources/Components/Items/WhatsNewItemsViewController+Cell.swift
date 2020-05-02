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
    final class Cell: UITableViewCell {
        
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
        init(
            item: WhatsNew.Item,
            configuration: WhatsNewViewController.Configuration
        ) {
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
            // Configure
            self.configure()
        }
        
        /// Initializer with Coder always returns nil
        required init?(coder aDecoder: NSCoder) {
            return nil
        }
        
        // MARK: View-Lifecycle
        
        /// TraitCollection did change
        /// - Parameter previousTraitCollection: The previous TraitCollection
        override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            super.traitCollectionDidChange(previousTraitCollection)
            // Re-Configure
            self.configure()
        }
        
    }
    
}

// MARK: - Configure

extension WhatsNewItemsViewController.Cell {
    
    /// Perform configuration
    func configure() {
        // Check if ItemsView Layout is not eqaul to centered
        if self.configuration.itemsView.layout != .centered {
            // Perform ImageView Configuration
            self.configureImageView()
        }
        // Perform TextLabel Configuration
        self.configureTextLabel()
    }
    
}

// MARK: - Configure TextLabel

extension WhatsNewItemsViewController.Cell {
    
    /// Configure TextLabel
    func configureTextLabel() {
        // Set font
        self.textLabel?.font = self.configuration.itemsView.subtitleFont
        // Set text color
        self.textLabel?.textColor = self.configuration.itemsView.subtitleColor
        // Set number of lines to zero
        self.textLabel?.numberOfLines = 0
        // Set line break mode to word wrapping
        self.textLabel?.lineBreakMode = .byWordWrapping
        // Set attributed text
        self.textLabel?.attributedText = self.makeAttributedTextString()
        // Set white background color
        self.backgroundColor = .white
        // Check if Layout is centered or right
        if self.configuration.itemsView.layout == .centered {
            // Set centered Text
            self.textLabel?.textAlignment = .center
        } else if self.configuration.itemsView.layout == .right {
            // Set Text to right
            self.textLabel?.textAlignment = .right
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
        // Declare an optional UIImage
        var image: UIImage?
        // Switch on ImageSize
        switch self.configuration.itemsView.imageSize {
        case .original:
            // Initialize Image with Item Image
            image = self.item.image
        case .fixed(let height):
            // Initialize Image with resized Item Image
            image = self.item.image?.resize(height: .init(height))
        }
        // Check if autoTintImage is activated
        if self.configuration.itemsView.autoTintImage {
            // Tint image with tint color
            image = image?.tint(color: self.configuration.tintColor)
        }
        // Set image
        self.imageView?.image = image
    }
    
}

// MARK: - Make AttributedString

extension WhatsNewItemsViewController.Cell {
    
    /// Make AttributedString Text String
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
            // Initialize Range
            let range = NSRange(location: 0, length: self.item.title.utf16.count)
            // Add title font
            titleSubtitleAttributedString.addAttributes(
                [.font: self.configuration.itemsView.titleFont],
                range: range
            )
            // Add title color
            titleSubtitleAttributedString.addAttributes(
                [.foregroundColor: self.configuration.itemsView.titleColor],
                range: range
            )
        }
        // Check if Layout is centered
        if self.configuration.itemsView.layout == .centered {
            // Initialize a TextAttachment
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

// MARK: - UIImage+Resize/Tint

private extension UIImage {
    
    /// Resize UIImage to a give height by keeping the aspect ratio
    ///
    /// - Parameter height: The height to resize to
    /// - Returns: The resized Image
    func resize(height: CGFloat) -> UIImage? {
        // Verify the height is greater zero
        guard height > 0 else {
            // Otherwise return nil
            return nil
        }
        // Initialize target Size
        let targetSize = CGSize(width: height, height: height)
        // Check if iOS 10 or greater is available
        if #available(iOS 10.0, *) {
            // Return rendererd Image with target size
            return UIGraphicsImageRenderer(size: targetSize).image { [weak self] _ in
                // Draw with target size
                self?.draw(in: .init(origin: .zero, size: targetSize))
            }
        } else {
            // Begin Image Context with target size
            UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
            // Draw Image with target size
            self.draw(in: .init(origin: .zero, size: targetSize))
            // Retrive Image from context
            let image = UIGraphicsGetImageFromCurrentImageContext()
            // End context
            UIGraphicsEndImageContext()
            // Return resized image
            return image
        }
    }
    
    /// Tint Image with Color
    ///
    /// - Parameter color: The Color
    /// - Returns: The tinted UIImage
    func tint(color: UIColor) -> UIImage? {
        // Verify that the size is not equal to zero
        guard self.size != .zero else {
            // Otherwise return untinted image
            return self
        }
        // Retrieve image as template image
        let image = self.withRenderingMode(.alwaysTemplate)
        // Begin Image Context
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        // Set color
        color.set()
        // Draw image with size
        image.draw(in: .init(origin: .zero, size: self.size))
        // Retrieve Image from context
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        // End context
        UIGraphicsEndImageContext()
        // Return tinted image
        return tintedImage
    }
    
}
