//
//  WhatsNewViewController+ItemsViewTheme.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 27.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - ItemsViewTheme

public extension WhatsNewViewController {
    
    /// The ItemsViewTheme
    struct ItemsViewTheme: Equatable {
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// The subtitle font
        public var subtitleFont: UIFont
        
        /// The subtitle color
        public var subtitleColor: UIColor
        
        /// Boolean if Image should be auto tinted
        public var autoTintImage: Bool
        
        /// The Animation
        public var animation: Animation?
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        ///   - subtitleFont: The subtitle font
        ///   - subtitleColor: The subtitle color
        ///   - autoTintImage: The autoTintImage boolean. Default value `true`
        ///   - animation: The Animation. Default value `nil`
        public init(titleFont: UIFont,
                    titleColor: UIColor,
                    subtitleFont: UIFont,
                    subtitleColor: UIColor,
                    autoTintImage: Bool = true,
                    animation: Animation? = nil) {
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.subtitleFont = subtitleFont
            self.subtitleColor = subtitleColor
            self.autoTintImage = autoTintImage
            self.animation = animation
        }
        
    }
    
}

// MARK: - ItemsViewTheme Animation

public extension WhatsNewViewController.ItemsViewTheme {
    
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

// MARK: - ItemsViewTheme Animator Typealias

public extension WhatsNewViewController.ItemsViewTheme {
    
    /// The Animator typealias closure with UIView and Item count
    typealias Animator = (UIView, Int) -> Void
    
}

// MARK: - ItemsViewTheme Animator Equatable

extension WhatsNewViewController.ItemsViewTheme.Animation: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    public static func == (lhs: WhatsNewViewController.ItemsViewTheme.Animation,
                           rhs: WhatsNewViewController.ItemsViewTheme.Animation) -> Bool {
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

// MARK: - ItemsViewTheme Animator RawRepresentable

extension WhatsNewViewController.ItemsViewTheme.Animation: RawRepresentable {
    
    /// Associated type RawValue as optional Animator
    public typealias RawValue = WhatsNewViewController.ItemsViewTheme.Animator
    
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

private extension WhatsNewViewController.ItemsViewTheme.Animation {
    
    /// Predefined Animation
    ///
    /// - Parameters:
    ///   - view: The View
    ///   - index: The Index
    func animate(view: UIView, index: Int) {
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
            // Standard duration
            withDuration: 0.5,
            // Incremented delay via Item count
            delay: 0.15 * (Double(index) + 1.0),
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
