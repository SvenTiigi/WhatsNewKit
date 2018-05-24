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
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - item: The WhatsNew Item
    ///   - theme: The Theme
    init(item: WhatsNew.Item,
         theme: WhatsNewViewController.Theme) {
        // Super init default style
        super.init(
            style: .default,
            reuseIdentifier: String(describing: WhatsNewItemTableViewCell.self)
        )
        // Set background color
        self.contentView.backgroundColor = theme.backgroundColor
        // Check if autoTintImage is activated
        if theme.itemsViewTheme.autoTintImage {
            // Set template tinted image
            let templateImage = item.image?.withRenderingMode(.alwaysTemplate)
            self.imageView?.image = templateImage
            self.imageView?.tintColor = theme.tintColor
        } else {
            // Set original image
            self.imageView?.image = item.image
        }
        // Check if title is empty
        if item.title.isEmpty {
            // Set text
            self.textLabel?.text = item.text
        } else {
            // Initialize attributed string
            let attributedString = NSMutableAttributedString(string: "\(item.title)\n\(item.text)")
            // Add title font
            attributedString.addAttributes(
                [NSAttributedStringKey.font: theme.itemsViewTheme.titleFont],
                range: NSRange(location: 0, length: item.title.count)
            )
            // Add title color
            attributedString.addAttributes(
                [NSAttributedStringKey.foregroundColor: theme.itemsViewTheme.titleColor],
                range: NSRange(location: 0, length: item.title.count)
            )
            // Set attributed text
            self.textLabel?.attributedText = attributedString
        }
        // Set font
        self.textLabel?.font = theme.itemsViewTheme.textFont
        // Set textcolor
        self.textLabel?.textColor = theme.itemsViewTheme.textColor
        // Set number of lines to zero
        self.textLabel?.numberOfLines = 0
        // Set linebreak mode to word wrapping
        self.textLabel?.lineBreakMode = .byWordWrapping
        // Set white background color
        self.backgroundColor = .white
    }
    
    /// Initializer with Coder always returns nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
