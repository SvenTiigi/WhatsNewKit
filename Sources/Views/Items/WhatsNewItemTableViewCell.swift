//
//  WhatsNewItemTableViewCell.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The WhatsNewItemTableViewCell
class WhatsNewItemTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    /// The Item
    private let item: WhatsNew.Item
    
    /// The Configuration
    private let configuration: WhatsNewViewController.Configuration
    
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
            reuseIdentifier: String(describing: WhatsNewItemTableViewCell.self)
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
    
    // MARK: Private API
    
    /// Configure ImageView
    private func configureImageView() {
        // Check if autoTintImage is activated
        if self.configuration.itemsView.autoTintImage {
            // Set template tinted image
            let templateImage = self.item.image?.withRenderingMode(.alwaysTemplate)
            self.imageView?.image = templateImage
            self.imageView?.tintColor = self.configuration.tintColor
        } else {
            // Set original image
            self.imageView?.image = self.item.image
        }
    }
    
    /// Configure TextLabel
    private func configureTextLabel() {
        // Set attributed text
        self.textLabel?.attributedText = self.getAttributedTextString()
        // Set font
        self.textLabel?.font = self.configuration.itemsView.subtitleFont
        // Set textcolor
        self.textLabel?.textColor = self.configuration.itemsView.subtitleColor
        // Set number of lines to zero
        self.textLabel?.numberOfLines = 0
        // Set linebreak mode to word wrapping
        self.textLabel?.lineBreakMode = .byWordWrapping
        // Set white background color
        self.backgroundColor = .white
        // Check if Layout is centered
        if self.configuration.itemsView.layout == .centered {
            // Set centered Text
            self.textLabel?.textAlignment = .center
        }
    }
    
    /// Retrieve AttributedString Text String
    ///
    /// - Returns: The Attributed String
    private func getAttributedTextString() -> NSAttributedString {
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
