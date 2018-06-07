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
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// The Animation
        public var animation: Animation?
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - title: The Title
        ///   - action: The Action
        ///   - hapticFeedback: The optional HapticFeedback
        ///   - titleFont: The title font. Default value `size: 17`
        ///   - titleColor: The title color. Default value `.whatsNewKitBlue`
        ///   - animation: The Animation. Default value `nil`
        public init(title: String,
                    action: Action,
                    hapticFeedback: HapticFeedback? = nil,
                    titleFont: UIFont = .systemFont(ofSize: 17),
                    titleColor: UIColor = .whatsNewKitBlue,
                    animation: Animation? = nil) {
            self.title = title
            self.action = action
            self.hapticFeedback = hapticFeedback
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.animation = animation
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
