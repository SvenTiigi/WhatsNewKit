//
//  WhatsNewButtonViewController.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 02.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - WhatsNewButtonViewController

/// The WhatsNewButtonViewController
class WhatsNewButtonViewController: UIViewController {
    
    // MARK: Properties
    
    /// The Configuration
    var configuration: WhatsNewViewController.Configuration
    
    /// The onPress closure
    let onPress: (ButtonType) -> Void
    
    /// The completion Button
    lazy var completionButton: UIButton = CompletionButton(
        title: self.configuration.completionButton.title,
        configuration: self.configuration,
        onPress: { [weak self] in
            // Invoke on press with completion button type
            self?.onPress(.completion)
        }
    )
    
    /// The detail button
    lazy var detailButton: UIButton = DetailButton(
        detailButton: self.configuration.detailButton,
        onPress: { [weak self] in
            // Invoke on press with detail button type
            self?.onPress(.detail)
        }
    )
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - configuration: The Configuration
    ///   - onPress: The onPress closure with ButtonType
    init(configuration: WhatsNewViewController.Configuration,
         onPress: @escaping (ButtonType) -> Void) {
        self.configuration = configuration
        self.onPress = onPress
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Initializer with Coder always return nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set background color
        self.view.backgroundColor = self.configuration.backgroundColor
        // Add Subviews
        self.addSubviews()
    }
    
    /// View did layout subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Perform animation if available
        self.configuration.detailButton?.animation?.rawValue(
            self.detailButton,
            .init(
                preferredDuration: 0.5,
                preferredDelay: 0.3
            )
        )
        // Perform animation if available
        self.configuration.completionButton.animation?.rawValue(
            self.completionButton,
            .init(
                preferredDuration: 0.5,
                preferredDelay: 0.4
            )
        )
        // Clear Animations
        self.configuration.detailButton?.animation = nil
        self.configuration.completionButton.animation = nil
    }
    
}

// MARK: - Add Subviews

extension WhatsNewButtonViewController {
    
    /// Add Subviews
    func addSubviews() {
        // Decalre the CompletionButtonTopAnchor
        let completionButtonTopAnchor: NSLayoutConstraint
        // Check if a DetailButton Configuration is available
        if let detailButton = self.configuration.detailButton {
            // Add DetailButton
            self.view.addSubview(self.detailButton, constraints: [
                self.detailButton.topAnchor.constraint(equalTo: self.anchor.topAnchor),
                self.detailButton.leadingAnchor.constraint(equalTo: self.anchor.leadingAnchor),
                self.detailButton.trailingAnchor.constraint(equalTo: self.anchor.trailingAnchor)
            ])
            // Initialize TopAnchor
            completionButtonTopAnchor = self.completionButton.topAnchor.constraint(
                equalTo: self.detailButton.bottomAnchor,
                constant: detailButton.bottomOffset
            )
        } else {
            // Initialize TopAnchor
            completionButtonTopAnchor = self.completionButton.topAnchor.constraint(equalTo: self.anchor.topAnchor)
        }
        // Add CompletionButton
        self.view.addSubview(self.completionButton, constraints: [
            completionButtonTopAnchor,
            self.completionButton.leadingAnchor.constraint(equalTo: self.anchor.leadingAnchor),
            self.completionButton.trailingAnchor.constraint(equalTo: self.anchor.trailingAnchor),
            self.completionButton.bottomAnchor.constraint(equalTo: self.anchor.bottomAnchor)
        ])
    }
    
}

// MARK: - ButtonType

extension WhatsNewButtonViewController {
    
    /// The ButtonType
    enum ButtonType: String, Codable, Equatable, Hashable, CaseIterable {
        /// Detail button
        case detail
        /// Completion button
        case completion
    }
    
}
