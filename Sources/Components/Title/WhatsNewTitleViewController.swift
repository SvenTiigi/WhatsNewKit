//
//  WhatsNewTitleViewController.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 02.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - WhatsNewTitleViewController

/// The WhatsNewTitleViewController
class WhatsNewTitleViewController: UIViewController {
    
    // MARK: Properties
    
    /// The WhatsNew Title
    let titleText: String
    
    /// The Configuration
    var configuration: WhatsNewViewController.Configuration
    
    /// The title label
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = self.configuration.titleView.titleAlignment
        label.lineBreakMode = .byWordWrapping
        label.font = self.configuration.titleView.titleFont
        label.textColor = self.configuration.titleView.titleColor
        // Check if a secondary color is available
        if let secondaryColor = self.configuration.titleView.secondaryColor {
            // Initialize Attribted Text
            let attributedText = NSMutableAttributedString(string: self.titleText)
            // Check if start index and length matches the string
            if self.titleText.dropFirst(secondaryColor.startIndex).count >= secondaryColor.length {
                // Add foreground color attribut
                attributedText.addAttributes(
                    [.foregroundColor: secondaryColor.color],
                    range: .init(
                        location: secondaryColor.startIndex,
                        length: secondaryColor.length
                    )
                )
            }
            // Set attributed text
            label.attributedText = attributedText
        } else {
            // No secondary color available simply set text
            label.text = self.titleText
        }
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
        self.titleText = title
        // Set configuration
        self.configuration = configuration
        // Super init
        super.init(nibName: nil, bundle: nil)
        // Set background color
        self.view.backgroundColor = self.configuration.backgroundColor
    }
    
    /// Initializer with Coder always return nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// Load View
    override func loadView() {
        self.view = self.titleLabel
    }
    
    /// View did layout Subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Perform animation if available
        self.configuration.titleView.animation?.rawValue(
            self.titleLabel,
            .init(
                preferredDuration: 0.5,
                preferredDelay: 0.2
            )
        )
        // Clear Animation
        self.configuration.titleView.animation = nil
    }
    
}
