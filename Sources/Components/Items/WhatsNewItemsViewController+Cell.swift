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
            image = self.item.image?.resizeToSquare(ofSize: .init(height))
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

// MARK: - UIImage+resizeToSquare

private extension UIImage {
    
    /// Resize UIImage to a square of the specified dimensions, preserving the aspect ratio.
    ///
    /// - Parameter ofSize: The size of the height and width of the destination square.
    /// - Returns: The resized Image
    func resizeToSquare(ofSize newSize: CGFloat) -> UIImage? {
        // Verify the size is greater zero
        guard newSize > 0 else {
            // Otherwise return nil
            return nil
        }
        // The returned image will be a square of the specified size
        let containerSize = CGSize(width: newSize, height: newSize)
        // The target size is the size of the image portion within the container. We preserve the aspect ratio, and ensure
        // that it touches the container edges either on the left & right sides, or top & bottom (or both).
        let targetSize: CGSize
        if self.size.width > self.size.height {
            targetSize = .init(
                width: newSize,
                height: (newSize / self.size.width) * self.size.height
            )
        } else {
            targetSize = .init(
                width: (newSize / self.size.height) * self.size.width,
                height: newSize
            )
        }
        // The origin for our redrawing, within the container, can be obtained by getting the difference between the container's
        // dimensions and the target size dimensions. Divided by 2,
        // since we want the redrawn image to be centered in the container.
        let redrawOrigin = CGPoint(
            x: (containerSize.width - targetSize.width) / 2,
            y: (containerSize.height - targetSize.height) / 2
        )
        // Check if iOS 10 or greater is available
        if #available(iOS 10.0, *) {
            // Return rendererd Image with target size
            return UIGraphicsImageRenderer(size: containerSize).image { [weak self] _ in
                // Draw with target size
                self?.draw(in: .init(origin: redrawOrigin, size: targetSize))
            }
        } else {
            // Begin Image Context with target size
            UIGraphicsBeginImageContextWithOptions(containerSize, false, 0.0)
            // Draw Image with target size
            self.draw(in: .init(origin: redrawOrigin, size: targetSize))
            // Retrive Image from context
            let image = UIGraphicsGetImageFromCurrentImageContext()
            // End context
            UIGraphicsEndImageContext()
            // Return resized image
            return image
        }
    }
    
}

// MARK: - UIImage+tint

private extension UIImage {
    
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
