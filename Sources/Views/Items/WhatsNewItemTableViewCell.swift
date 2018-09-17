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
        // Perform ImageView Configuration
        self.configureImageView()
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
    }
    
    /// Retrieve AttributedString Text String
    ///
    /// - Returns: The Attributed String
    private func getAttributedTextString() -> NSAttributedString {
        // Check if title is empty
        if self.item.title.isEmpty {
            // Just return the item subtitle has no title is available
            return NSAttributedString(string: self.item.subtitle)
        } else {
            // Initialize attributed string
            let attributedString = NSMutableAttributedString(string: "\(self.item.title)\n\(self.item.subtitle)")
            // Add title font
            attributedString.addAttributes(
                [.font: self.configuration.itemsView.titleFont],
                range: NSRange(location: 0, length: self.item.title.count)
            )
            // Add title color
            attributedString.addAttributes(
                [.foregroundColor: self.configuration.itemsView.titleColor],
                range: NSRange(location: 0, length: self.item.title.count)
            )
            // Return attributed title and text string
            return attributedString
        }
    }

}
