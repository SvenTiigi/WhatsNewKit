//
//  WhatsNewButtonView.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The WhatsNewButtonView
class WhatsNewButtonView: ThemableView {
    
    // MARK: Properties
    
    /// The ButtonType
    public enum ButtonType {
        /// Detail button
        case detail
        /// Completion button
        case completion
    }
    
    /// The completion button title
    private let completionButtonTitle: String
    
    /// The optional detail button title
    private var detailButtonTitle: String?
    
    /// The onPress closure
    private let onPress: (ButtonType) -> Void
    
    /// The completion Button
    private lazy var completionButton = WhatsNewRoundedButton(
        title: self.completionButtonTitle,
        theme: self.theme,
        onPress: { [weak self] in
            self?.onPress(.completion)
        }
    )
    
    /// The detail button
    private lazy var detailButton: UIButton = {
        // Initialize Button
        let button = UIButton()
        // Set title
        button.setTitle(
            self.detailButtonTitle,
            for: .normal
        )
        // Add target
        button.addTarget(
            self,
            action: #selector(self.detailButtonDidTouchUpInside),
            for: .touchUpInside
        )
        // Set title color
        button.setTitleColor(
            theme.detailButtonTheme.titleColor,
            for: .normal
        )
        // Set font
        button.titleLabel?.font = theme.detailButtonTheme.titleFont
        return button
    }()
    
    // MARK: Initializer

    /// Default initializer
    ///
    /// - Parameters:
    ///   - completionButtonTitle: The completion button title
    ///   - detailButtonTitle: The detail button title
    ///   - theme: The Theme
    ///   - onPress: The onPress closure with ButtonType
    init(completionButtonTitle: String,
         detailButtonTitle: String?,
         theme: WhatsNewViewController.Theme,
         onPress: @escaping (ButtonType) -> Void) {
        // Set completion button title
        self.completionButtonTitle = completionButtonTitle
        // Set detail button title
        self.detailButtonTitle = detailButtonTitle
        // Set onPress
        self.onPress = onPress
        // Super init theme
        super.init(theme: theme)
        // Set background color
        self.backgroundColor = self.theme.backgroundColor
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
        // Check if orientation is portrait and detail button title is available
        if UIScreen.main.bounds.height > UIScreen.main.bounds.width && self.detailButtonTitle != nil {
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
            self.completionButton.frame = CGRect(
                x: padding,
                y: self.frame.size.height / 2 - buttonHeight / 2,
                width: self.frame.size.width - padding * 2,
                height: buttonHeight
            )
        }
    }
    
    // MARK: Target Handler
    
    /// DetailButton did touch up inside
    @objc private func detailButtonDidTouchUpInside() {
        self.onPress(.detail)
    }
    
}
