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
        public let title: String
        
        /// The Action
        public let action: Action
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - title: The Title as String. Default value `Continue`
        ///   - action: The Action. Default value `dismiss`
        public init(title: String = "Continue",
                    action: Action = .dismiss) {
            self.title = title
            self.action = action
        }
    }
    
}

// MARK: - ExpressibleByStringLiteral CompletionButton

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
