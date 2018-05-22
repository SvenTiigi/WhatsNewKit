//
//  WhatsNewButtonView.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The WhatsNewButtonView
class WhatsNewButtonView: UIView {
    
    // MARK: Properties
    
    /// The ButtonType
    public enum ButtonType {
        /// Detail button
        case detail
        /// Completion button
        case completion
    }
    
    /// The detail action
    private let detailButton: WhatsNew.Detail.Button?
    
    /// The completion action
    private let button: WhatsNew.Button
    
    /// The onPress closure
    private let onPress: (ButtonType) -> Void
    
    /// The completion Button
    private lazy var completionButton = WhatsNewRoundedButton(
        button: self.button,
        onPress: { [weak self] in
            self?.onPress(.completion)
        }
    )
    
    /// The detail button
    private lazy var detailUIButton: UIButton = {
        // Initialize Button
        let button = UIButton()
        // Set title
        button.setTitle(
            self.detailButton?.text,
            for: .normal
        )
        // Set title color
        button.setTitleColor(
            self.detailButton?.configuration.textColor,
            for: .normal
        )
        // Set font
        button.titleLabel?.font = self.detailButton?.configuration.textFont
        // Add target
        button.addTarget(
            self,
            action: #selector(self.detailButtonDidTouchUpInside),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - detailButton: The detail button
    ///   - button: The button
    ///   - backgroundColor: The background color
    ///   - onPress: The on press closure
    init(detailButton: WhatsNew.Detail.Button?,
         button: WhatsNew.Button,
         backgroundColor: UIColor,
         onPress: @escaping (ButtonType) -> Void) {
        // Set detail action
        self.detailButton = detailButton
        // Set button
        self.button = button
        // Set onPress
        self.onPress = onPress
        // Super init with zero frame
        super.init(frame: .zero)
        // Set background color
        self.backgroundColor = backgroundColor
        // Add Button subview
        self.addSubview(self.completionButton)
        self.addSubview(self.detailUIButton)
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
        let buttonHeight: CGFloat = UIDevice.current.orientation == .portrait ? 60 : 50
        // Check if orientation is portrait
        if UIDevice.current.orientation == .portrait && self.detailButton != nil {
            // Set DetailButton frame
            self.detailUIButton.frame = CGRect(
                x: 0,
                y: 20,
                width: self.frame.size.width,
                height: self.frame.size.height / 5
            )
            // Set CompletionButton frame
            self.completionButton.frame = CGRect(
                x: padding,
                y: self.detailUIButton.frame.size.height + 30,
                width: self.frame.size.width - padding * 2,
                height: buttonHeight
            )
        } else {
            // Clear DetailButton frame
            self.detailUIButton.frame = .zero
            // Set CompletionButton frame
            self.completionButton.frame = CGRect(
                x: padding,
                y: (self.frame.size.height / 2) - (buttonHeight / 2),
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
