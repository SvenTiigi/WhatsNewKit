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
    init(item: WhatsNew.Item) {
        // Super init default style
        super.init(
            style: .default,
            reuseIdentifier: String(describing: WhatsNewItemTableViewCell.self)
        )
        // Set image
        self.imageView?.image = item.image
        // Check if title is empty
        if item.title.isEmpty {
            // Set text
            self.textLabel?.text = item.text
        } else {
            // Initialize attributed string
            let attributedString = NSMutableAttributedString(string: "\(item.title)\n\(item.text)")
            // Add title font
            attributedString.addAttributes(
                [NSAttributedStringKey.font: item.configuration.titleFont],
                range: NSRange(location: 0, length: item.title.count)
            )
            // Add title color
            attributedString.addAttributes(
                [NSAttributedStringKey.foregroundColor: item.configuration.titleColor],
                range: NSRange(location: 0, length: item.title.count)
            )
            // Set attributed text
            self.textLabel?.attributedText = attributedString
        }
        // Set font
        self.textLabel?.font = item.configuration.textFont
        // Set textcolor
        self.textLabel?.textColor = item.configuration.textColor
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
