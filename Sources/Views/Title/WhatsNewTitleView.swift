//
//  WhatsNewTitleView.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The WhatsNewTitleView
class WhatsNewTitleView: ThemableView {
    
    // MARK: Properties
    
    /// The WhatsNew Title
    private let title: String

    /// The title label
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.title
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = self.theme.titleViewTheme.titleFont
        label.textColor = self.theme.titleViewTheme.titleColor
        return label
    }()
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - title: The Title
    ///   - theme: The Theme
    init(title: String,
         theme: WhatsNewViewController.Theme) {
        // Set title
        self.title = title
        // Super init theme
        super.init(theme: theme)
        // Set background color
        self.backgroundColor = self.theme.backgroundColor
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
