//
//  WhatsNewViewController+CompletionButton.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 27.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - CompletionButton

public extension WhatsNewViewController {
    
    /// The CompletionButton
    struct CompletionButton: Equatable {
        
        /// The Title
        public var title: String
        
        /// The Action
        public var action: Action
        
        /// The HapticFeedback
        public var hapticFeedback: HapticFeedback?
        
        /// The background color
        public var backgroundColor: UIColor
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// The corner radius
        public var cornerRadius: CGFloat
        
        /// The Animation
        public var animation: Animation?
        
        /// The Insets
        public var insets: UIEdgeInsets
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - title: The Title. Default value `Continue`
        ///   - action: The Action. Default value `.dismiss`
        ///   - hapticFeedback: The optional HapticFedback. Default value `nil`
        ///   - backgroundColor: The background color. Default value `.whatsNewKitBlue`
        ///   - titleFont: The title font. Default value `size: 17, weight: semibold`
        ///   - titleColor: The title color. Default value `white`
        ///   - cornerRadius: The corner radius. Default value `8.0`
        ///   - animation: The Animation. Default value `nil`
        ///   - insets: The UIEdgeInsets. Default value `top: 5, left: 20, bottom: 25, right: 20`
        public init(title: String = "Continue",
                    action: Action = .dismiss,
                    hapticFeedback: HapticFeedback? = nil,
                    backgroundColor: UIColor = .whatsNewKitBlue,
                    titleFont: UIFont = .systemFont(ofSize: 17, weight: .semibold),
                    titleColor: UIColor = .white,
                    cornerRadius: CGFloat = 8.0,
                    animation: Animation? = nil,
                    insets: UIEdgeInsets = .init(top: 5, left: 20, bottom: 25, right: 20)) {
            self.title = title
            self.action = action
            self.hapticFeedback = hapticFeedback
            self.backgroundColor = backgroundColor
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.cornerRadius = cornerRadius
            self.animation = animation
            self.insets = insets
        }
    }
    
}

// MARK: - ExpressibleByStringLiteral

extension WhatsNewViewController.CompletionButton: ExpressibleByStringLiteral {
    
    /// A type that represents a string literal.
    ///
    /// Valid types for `StringLiteralType` are `String` and `StaticString`.
    public typealias StringLiteralType = String
    
    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral value: String) {
        self.init(title: value)
    }
    
}

// MARK: - CompletionButton.Action

public extension WhatsNewViewController.CompletionButton {
    
    /// The CompletionButton Action
    enum Action {
        /// Dismiss
        case dismiss
        /// Perform custom completion action
        case custom(action: (WhatsNewViewController) -> Void)
    }
    
}

// MARK: - Equatable CompletionButton.Action

extension WhatsNewViewController.CompletionButton.Action: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    public static func == (lhs: WhatsNewViewController.CompletionButton.Action,
                           rhs: WhatsNewViewController.CompletionButton.Action) -> Bool {
        switch (lhs, rhs) {
        case (.dismiss, .dismiss):
            return true
        case (.custom, .custom):
            return true
        default:
            return false
        }
    }
    
}
