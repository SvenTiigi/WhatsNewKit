//
//  WhatsNewTitleView.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The WhatsNewTitleView
class WhatsNewTitleView: UIView {
    
    // MARK: Properties
    
    /// The WhatsNew Title
    private let title: WhatsNew.Title

    /// The title label
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.title.text
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = self.title.configuration.textFont
        label.textColor = self.title.configuration.textColor
        return label
    }()
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - title: The WhatsNew Title
    ///   - backgroundColor: The background color
    init(title: WhatsNew.Title,
         backgroundColor: UIColor) {
        // Set title
        self.title = title
        // Super init zero frame
        super.init(frame: .zero)
        // Set background color
        self.backgroundColor = backgroundColor
        // Add title label
        self.addSubview(self.titleLabel)
    }
    
    /// Initializer with Coder always returns nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        // Initialize label height
        let titleLabelHeight: CGFloat = self.frame.size.height * 0.7
        // Set title label frame
        self.titleLabel.frame = CGRect(
            x: 0,
            y: self.frame.size.height - titleLabelHeight,
            width: self.frame.size.width,
            height: titleLabelHeight
        )
    }
    
}
