//
//  WhatsNewViewController+HapticFeedback.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 28.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The HapticFeedback Enumeration
public enum HapticFeedback: Equatable {
    
    /// ImpactFeedback
    case impact
    
    /// SelectionFeedback
    case selection
    
    /// NotificationFeedback with FeedbackType
    case notification(UINotificationFeedbackType)
    
    /// Execute Feedback
    func execute() {
        // Switch on self
        switch self {
        case .impact:
            let impactFeedbackGenerator = UIImpactFeedbackGenerator()
            impactFeedbackGenerator.impactOccurred()
        case .selection:
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            selectionFeedbackGenerator.selectionChanged()
        case .notification(let feedbackType):
            let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
            notificationFeedbackGenerator.notificationOccurred(feedbackType)
        }
    }
    
}
