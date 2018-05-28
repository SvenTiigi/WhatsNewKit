//
//  WhatsNewViewController+DetailButton.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 27.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - DetailButton

public extension WhatsNewViewController {
    
    /// The DetailButton
    struct DetailButton: Equatable {
        
        /// The Title
        public var title: String
        
        /// The Action
        public var action: Action
        
        /// The HapticFeedback
        public var hapticFeedback: HapticFeedback?
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - title: The Title as String
        ///   - action: The Action
        ///   - hapticFeedback: The optional HapticFeedback. Default value `nil`
        public init(title: String,
                    action: Action,
                    hapticFeedback: HapticFeedback? = nil) {
            self.title = title
            self.action = action
            self.hapticFeedback = hapticFeedback
        }
    }
    
}

// MARK: - DetailButton.Action

public extension WhatsNewViewController.DetailButton {
    
    /// DetailButton Action
    enum Action {
        /// Present Website on URL
        case website(url: String)
        /// Perform custom detail action
        case custom(action: (WhatsNewViewController) -> Void)
    }
    
}

// MARK: - Equatable DetailButton.Action

extension WhatsNewViewController.DetailButton.Action: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    public static func == (lhs: WhatsNewViewController.DetailButton.Action,
                           rhs: WhatsNewViewController.DetailButton.Action) -> Bool {
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
