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
    private let title: String
    
    /// The Configuration
    private let configuration: WhatsNewViewController.Configuration
    
    /// Bool has animated
    private var hasAnimated = false

    /// The title label
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.title
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = self.configuration.titleView.titleFont
        label.textColor = self.configuration.titleView.titleColor
        return label
    }()
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - title: The Title
    ///   - configuration: The Configuration
    init(title: String,
         configuration: WhatsNewViewController.Configuration) {
        // Set title
        self.title = title
        // Set configuration
        self.configuration = configuration
        // Super init
        super.init(frame: .zero)
        // Set background color
        self.backgroundColor = self.configuration.backgroundColor
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
        // Check if TitleLabel frame is not empty and hasn't animated
        if self.titleLabel.frame != .zero && !self.hasAnimated {
            // Perform animation if available
            self.configuration.titleView.animation?.rawValue(
                self.titleLabel,
                .init(
                    preferredDuration: 0.5,
                    preferredDelay: 0.2
                )
            )
            // Set animated true
            self.hasAnimated = true
        }
        // Set title label frame
        self.titleLabel.frame = CGRect(
            x: 0,
            y: self.frame.size.height - titleLabelHeight,
            width: self.frame.size.width,
            height: titleLabelHeight
        )
    }
    
}
