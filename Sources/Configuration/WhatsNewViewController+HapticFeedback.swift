//
//  WhatsNewViewController+HapticFeedback.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 28.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - HapticFeedback

public extension WhatsNewViewController {
    
    /// The HapticFeedback Enumeration
    enum HapticFeedback: Equatable {
        /// ImpactFeedback with FeedbackStyle
        case impact(UIImpactFeedbackGenerator.FeedbackStyle)
        /// SelectionFeedback
        case selection
        /// NotificationFeedback with FeedbackType
        case notification(UINotificationFeedbackGenerator.FeedbackType)
        
        /// Execute HapticFeedback
        func execute() {
            // Switch on self
            switch self {
            case .impact(let style):
                // UIFeedbackGenerator
                let feedbackGenerator = UIImpactFeedbackGenerator(style: style)
                feedbackGenerator.impactOccurred()
            case .selection:
                // UISelectionFeedbackGenerator
                let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
                selectionFeedbackGenerator.selectionChanged()
            case .notification(let type):
                // UINotificationFeedbackGenerator
                let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
                notificationFeedbackGenerator.notificationOccurred(type)
            }
        }
        
    }
    
}
