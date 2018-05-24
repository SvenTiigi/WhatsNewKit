//
//  WhatsNewViewController+Configuration.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 24.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation

// MARK: - Configuration

public extension WhatsNewViewController {
    
    /// The WhatsNewViewController Configuration
    struct Configuration: Equatable {
        
        /// The Theme
        public let theme: Theme
        
        /// The optional DetailButton
        public let detailButton: DetailButton?
        
        /// The CompletionButton
        public let completionButton: CompletionButton
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - theme: The Theme. Default value `.default`
        ///   - detailButton: The optional DetailButton
        ///   - completionButton: The CompletionButton
        public init(theme: Theme = .default,
                    detailButton: DetailButton? = nil,
                    completionButton: CompletionButton) {
            self.theme = theme
            self.detailButton = detailButton
            self.completionButton = completionButton
        }
        
    }
    
}

// MARK: - DetailButton

public extension WhatsNewViewController.Configuration {
    
    /// The DetailButton
    struct DetailButton: Equatable {
        
        /// The Title
        public let title: String
        
        /// The Action
        public let action: Action
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - title: The Title as String
        ///   - action: The Action
        public init(title: String,
                    action: Action) {
            self.title = title
            self.action = action
        }
    }
    
}

// MARK: - Configuration.DetailButton.Action

public extension WhatsNewViewController.Configuration.DetailButton {
    
    /// DetailButton Action
    enum Action {
        /// Present Website on URL
        case website(url: String)
        /// Perform custom detail action
        case custom(action: (WhatsNewViewController) -> Void)
    }
    
}

// MARK: - Equatable Configuration.DetailButton.Action

extension WhatsNewViewController.Configuration.DetailButton.Action: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    public static func == (lhs: WhatsNewViewController.Configuration.DetailButton.Action,
                           rhs: WhatsNewViewController.Configuration.DetailButton.Action) -> Bool {
        switch (lhs, rhs) {
        case (.website, .website):
            return true
        case (.custom, .custom):
            return true
        default:
            return false
        }
    }
    
}

// MARK: - Configuration.CompletionButton

public extension WhatsNewViewController.Configuration {
    
    /// The CompletionButton
    struct CompletionButton: Equatable {
        
        /// The Title
        public let title: String
        
        /// The Action
        public let action: Action
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - title: The Title as String
        ///   - action: The Action. Default value `dismiss`
        public init(title: String,
                    action: Action = .dismiss) {
            self.title = title
            self.action = action
        }
    }
    
}

// MARK: - ExpressibleByStringLiteral Configuration.CompletionButton

extension WhatsNewViewController.Configuration.CompletionButton: ExpressibleByStringLiteral {
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: String) {
        self.init(title: value)
    }
    
}

// MARK: - Configuration.CompletionButton.Action

public extension WhatsNewViewController.Configuration.CompletionButton {
    
    /// The CompletionButton Action
    enum Action {
        /// Dismiss
        case dismiss
        /// Perform custom completion action
        case custom(action: (WhatsNewViewController) -> Void)
    }
    
}

// MARK: - Equatable Configuration.CompletionButton.Action

extension WhatsNewViewController.Configuration.CompletionButton.Action: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    public static func == (lhs: WhatsNewViewController.Configuration.CompletionButton.Action,
                           rhs: WhatsNewViewController.Configuration.CompletionButton.Action) -> Bool {
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
