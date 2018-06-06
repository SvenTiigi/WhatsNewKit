//
//  WhatsNewViewController+Animation.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 06.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Animation

public extension WhatsNewViewController {
    
    /// The Animation
    enum Animation {
        /// Fade
        case fade
        /// Slide up
        case slideUp
        /// Slide down
        case slideDown
        /// Slide left
        case slideLeft
        /// Slide right
        case slideRight
        /// Custom Animation
        case custom(animator: Animator)
    }
    
}

// MARK: - Animator Equatable

extension WhatsNewViewController.Animation: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    public static func == (lhs: WhatsNewViewController.Animation,
                           rhs: WhatsNewViewController.Animation) -> Bool {
        // Switch on lhs and rhs
        switch (lhs, rhs) {
        case (.fade, .fade):
            return true
        case (.slideUp, .slideUp):
            return true
        case (.slideDown, .slideDown):
            return true
        case (.slideLeft, .slideLeft):
            return true
        case (.slideRight, .slideRight):
            return true
        case (.custom, .custom):
            return true
        default:
            return false
        }
    }
    
}

// MARK: - Animator Typealias

public extension WhatsNewViewController.Animation {
    
    /// The Animator typealias closure with UIView and Item count
    typealias Animator = (UIView, AnimatorSettings) -> Void
    
    /// The AnimatorSettings
    struct AnimatorSettings: Codable, Equatable {
        
        /// The preferred duration
        public let preferredDuration: TimeInterval
        
        /// The preferred delay
        public let preferredDelay: TimeInterval
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - preferredDuration: The preferred duration
        ///   - preferredDelay: The preferred delay
        public init(preferredDuration: TimeInterval,
                    preferredDelay: TimeInterval) {
            self.preferredDuration = preferredDuration
            self.preferredDelay = preferredDelay
        }
        
    }
    
}

// MARK: - Animator RawRepresentable

extension WhatsNewViewController.Animation: RawRepresentable {
    
    /// Associated type RawValue as optional Animator
    public typealias RawValue = WhatsNewViewController.Animation.Animator
    
    /// RawRepresentable initializer
    ///
    /// - Parameters:
    ///   - rawValue: The rawValue
    public init?(rawValue: @escaping RawValue) {
        self = .custom(animator: rawValue)
    }
    
    /// The optional Animator rawValue
    public var rawValue: RawValue {
        switch self {
        case .custom(animator: let animator):
            // Return custom animator
            return animator
        case .fade, .slideUp, .slideDown, .slideLeft, .slideRight:
            // Return predefined animation
            return self.animate
        }
    }
    
}

// MARK: Predefined Animation

private extension WhatsNewViewController.Animation {
    
    /// Predefined Animation
    ///
    /// - Parameters:
    ///   - view: The View
    ///   - index: The Index
    func animate(view: UIView, animatorSettings: AnimatorSettings) {
        // Declare Transform
        let transform: CGAffineTransform
        // Switch on self to initialize Transform
        switch self {
        case .slideUp:
            transform = CGAffineTransform(
                translationX: 0,
                y: view.frame.size.height / 2
            )
        case .slideDown:
            transform = CGAffineTransform(
                translationX: 0,
                y: view.frame.size.height / -2
            )
        case .slideLeft:
            transform = CGAffineTransform(
                translationX: view.frame.size.width,
                y: 0
            )
        case .slideRight:
            transform = CGAffineTransform(
                translationX: -view.frame.size.width,
                y: 0
            )
        default:
            transform = .identity
        }
        // Apply Transform
        view.transform = transform
        // Set zero alpha
        view.alpha = 0.0
        // Perform animation
        UIView.animate(
            // Duration
            withDuration: animatorSettings.preferredDuration,
            // Delay
            delay: animatorSettings.preferredDelay,
            // Ease in and out
            options: .curveEaseInOut,
            animations: {
                // Set identitiy transform
                view.transform = .identity
                // Set default alpha
                view.alpha = 1.0
        })
    }
    
}
