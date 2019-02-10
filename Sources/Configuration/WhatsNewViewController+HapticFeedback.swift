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
        case impact(ImpactFeedbackStyle)
        /// SelectionFeedback
        case selection
        /// NotificationFeedback with FeedbackType
        case notification(NotificationFeedbackType)
    }
    
}

// MARK: - HapticFeedback+Execute

extension WhatsNewViewController.HapticFeedback {
    
    /// Execute HapticFeedback
    func execute() {
        // Check if iOS 10 or greater is available
        if #available(iOS 10.0, *) {
            // Switch on self
            switch self {
            case .impact(let style):
                // UIFeedbackGenerator
                let feedbackGenerator = UIImpactFeedbackGenerator(style: style.rawStyle)
                feedbackGenerator.impactOccurred()
            case .selection:
                // UISelectionFeedbackGenerator
                let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
                selectionFeedbackGenerator.selectionChanged()
            case .notification(let type):
                // UINotificationFeedbackGenerator
                let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
                notificationFeedbackGenerator.notificationOccurred(type.rawType)
            }
        }
    }
    
}

// MARK: - ImpactFeedbackStyle

public extension WhatsNewViewController.HapticFeedback {
    
    /// The ImpactFeedbackStyle
    enum ImpactFeedbackStyle: String, Codable, Equatable, Hashable, CaseIterable {
        /// Light
        case light
        /// Medium
        case medium
        /// Heavy
        case heavy
    }
    
}

// MARK: - ImpactFeedbackStyle+RawStyle

extension WhatsNewViewController.HapticFeedback.ImpactFeedbackStyle {
    
    /// The Raw Style
    @available(iOS 10.0, *)
    var rawStyle: UIImpactFeedbackGenerator.FeedbackStyle {
        switch self {
        case .light:
            return .light
        case .medium:
            return .medium
        case .heavy:
            return .heavy
        }
    }
    
}

// MARK: - NotificationFeedbackType

public extension WhatsNewViewController.HapticFeedback {
    
    /// The NotificationFeedbackType
    enum NotificationFeedbackType: String, Codable, Equatable, Hashable, CaseIterable {
        /// Success
        case success
        /// Warning
        case warning
        /// Error
        case error
    }
    
}

// MARK: - NotificationFeedbackType+RawType

extension WhatsNewViewController.HapticFeedback.NotificationFeedbackType {

    /// The Raw Type
    @available(iOS 10.0, *)
    var rawType: UINotificationFeedbackGenerator.FeedbackType {
        switch self {
        case .success:
            return .success
        case .warning:
            return .warning
        case .error:
            return .error
        }
    }
    
}
