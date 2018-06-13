//
//  WhatsNewButtonsView.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The WhatsNewButtonsView
class WhatsNewButtonsView: UIView {
    
    // MARK: Properties
    
    /// The ButtonType
    public enum ButtonType {
        /// Detail button
        case detail
        /// Completion button
        case completion
    }
    
    /// The Configuration
    private let configuration: WhatsNewViewController.Configuration
    
    /// The onPress closure
    private let onPress: (ButtonType) -> Void
    
    /// The completion Button
    private lazy var completionButton = WhatsNewCompletionButton(
        title: self.configuration.completionButton.title,
        configuration: self.configuration,
        onPress: { [weak self] in
            // Invoke on press with completion button type
            self?.onPress(.completion)
        }
    )
    
    /// The detail button
    private lazy var detailButton = WhatsNewDetailButton(
        detailButton: self.configuration.detailButton,
        onPress: { [weak self] in
            // Invoke on press with detail button type
            self?.onPress(.detail)
        }
    )
    
    /// Has animated Bool-Tupel for Detail and Completion Button
    public var hasAnimated: (detail: Bool, completion: Bool) = (false, false)
    
    // MARK: Initializer

    /// Default initializer
    ///
    /// - Parameters:
    ///   - configuration: The Configuration
    ///   - onPress: The onPress closure with ButtonType
    init(configuration: WhatsNewViewController.Configuration,
         onPress: @escaping (ButtonType) -> Void) {
        // Set Configuration
        self.configuration = configuration
        // Set onPress
        self.onPress = onPress
        // Super init theme
        super.init(frame: .zero)
        // Set background color
        self.backgroundColor = self.configuration.backgroundColor
        // Add completion Button subview
        self.addSubview(self.completionButton)
        // Add detail Button subview
        self.addSubview(self.detailButton)
    }
    
    /// Initializer with Coder always returns nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        // Initialize padding constant
        let padding: CGFloat = 20
        // Initialize button height constant
        let buttonHeight: CGFloat = 60.0
        // Check if detail button frame is not empty and hasn't animated
        if self.detailButton.frame != .zero && !self.hasAnimated.detail {
            // Perform animation if available
            self.configuration.detailButton?.animation?.rawValue(
                self.detailButton,
                .init(
                    preferredDuration: 0.5,
                    preferredDelay: 0.3
                )
            )
            // Set animated true
            self.hasAnimated.detail = true
        }
        // Check if completion button frame is not empty and hasn't animated
        if self.completionButton.frame != .zero && !self.hasAnimated.completion {
            // Perform animation if available
            self.configuration.completionButton.animation?.rawValue(
                self.completionButton,
                .init(
                    preferredDuration: 0.5,
                    preferredDelay: 0.4
                )
            )
            // Set animated true
            self.hasAnimated.completion = true
        }
        // Check if orientation is portrait and detail button title is available
        if UIScreen.main.bounds.height > UIScreen.main.bounds.width
            && self.configuration.detailButton != nil {
            // Set DetailButton frame
            self.detailButton.frame = CGRect(
                x: 0,
                y: padding / 2,
                width: self.frame.size.width,
                height: self.frame.size.height / 5
            )
            // Set CompletionButton frame
            self.completionButton.frame = CGRect(
                x: padding,
                y: self.detailButton.frame.size.height + padding,
                width: self.frame.size.width - padding * 2,
                height: buttonHeight
            )
        } else {
            // Clear DetailButton frame
            self.detailButton.frame = .zero
            // Set CompletionButton frame
            let landScapeButtonHeight: CGFloat = 50
            let landScapePadding: CGFloat = 40
            self.completionButton.frame = CGRect(
                x: landScapePadding,
                y: self.frame.size.height / 2 - landScapeButtonHeight / 2 - padding / 4,
                width: self.frame.size.width - landScapePadding * 2,
                height: landScapeButtonHeight
            )
        }
    }
    
}
