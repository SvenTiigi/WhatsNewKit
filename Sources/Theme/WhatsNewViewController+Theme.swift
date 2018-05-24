//
//  WhatsNewViewController+Theme.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 22.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Theme

public extension WhatsNewViewController {
    
    /// The Theme
    struct Theme: Equatable {
        
        /// The background color
        public var backgroundColor: UIColor
        
        /// The title view thrme
        public var titleViewTheme: TitleViewTheme
        
        /// The items view theme
        public var itemsViewTheme: ItemsViewTheme
        
        /// The detail button theme
        public var detailButtonTheme: DetailButtonTheme
        
        /// The completion button theme
        public var completionButtonTheme: CompletionButtonTheme
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - backgroundColor: The background color
        ///   - titleViewTheme: The TitleViewTheme
        ///   - itemsViewTheme: The ItemsViewTheme
        ///   - detailButtonTheme: The DetailButtonTheme
        ///   - completionButtonTheme: The CompletionButtonTheme
        public init(backgroundColor: UIColor,
                    titleViewTheme: TitleViewTheme,
                    itemsViewTheme: ItemsViewTheme,
                    detailButtonTheme: DetailButtonTheme,
                    completionButtonTheme: CompletionButtonTheme) {
            self.backgroundColor = backgroundColor
            self.titleViewTheme = titleViewTheme
            self.itemsViewTheme = itemsViewTheme
            self.detailButtonTheme = detailButtonTheme
            self.completionButtonTheme = completionButtonTheme
        }
        
    }
    
}

// MARK: - TitleViewTheme

public extension WhatsNewViewController.Theme {
    
    /// The TitleViewTheme
    struct TitleViewTheme: Equatable {
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        public init(titleFont: UIFont,
                    titleColor: UIColor) {
            self.titleFont = titleFont
            self.titleColor = titleColor
        }
        
    }
    
}

// MARK: - ItemsViewTheme

public extension WhatsNewViewController.Theme {
    
    /// The ItemsViewTheme
    struct ItemsViewTheme: Equatable {
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// The text font
        public var textFont: UIFont
        
        /// The text color
        public var textColor: UIColor
        
        /// The Animation
        public var animation: Animation
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        ///   - textFont: The text font
        ///   - textColor: The text color
        ///   - animation: The Animation
        public init(titleFont: UIFont,
                    titleColor: UIColor,
                    textFont: UIFont,
                    textColor: UIColor,
                    animation: Animation) {
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.textFont = textFont
            self.textColor = textColor
            self.animation = animation
        }
        
    }
    
}

// MARK: - ItemsViewTheme Animation

public extension WhatsNewViewController.Theme.ItemsViewTheme {
    
    /// The Animation
    enum Animation {
        /// None
        case none
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

public extension WhatsNewViewController.Theme.ItemsViewTheme {
    
    /// The Animator typealias closure with UIView and Item count
    typealias Animator = (UIView, Int) -> Void
    
}

// MARK: - ItemsViewTheme Animator Equatable

extension WhatsNewViewController.Theme.ItemsViewTheme.Animation: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    public static func == (lhs: WhatsNewViewController.Theme.ItemsViewTheme.Animation,
                           rhs: WhatsNewViewController.Theme.ItemsViewTheme.Animation) -> Bool {
        // Switch on lhs and rhs
        switch (lhs, rhs) {
        case (.none, .none):
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

extension WhatsNewViewController.Theme.ItemsViewTheme.Animation: RawRepresentable {

    /// Associated type RawValue as optional Animator
    public typealias RawValue = WhatsNewViewController.Theme.ItemsViewTheme.Animator?

    /// RawRepresentable initializer. Which always returns nil
    ///
    /// - Parameters:
    ///   - rawValue: The rawValue
    public init?(rawValue: RawValue) {
        return nil
    }

    /// The optional Animator rawValue
    public var rawValue: RawValue {
        switch self {
        case .none:
            return nil
        case .custom(animator: let animator):
            return animator
        default:
            // Return predefined animation
            return { view, index in
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
                    transform = CGAffineTransform(
                        translationX: 0,
                        y: 0
                    )
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
    }

}

// MARK: - DetailButtonTheme

public extension WhatsNewViewController.Theme {
    
    /// The DetailButtonTheme
    struct DetailButtonTheme: Equatable {
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        public init(titleFont: UIFont,
                    titleColor: UIColor) {
            self.titleFont = titleFont
            self.titleColor = titleColor
        }
        
    }
    
}

// MARK: - CompletionButtonTheme

public extension WhatsNewViewController.Theme {
    
    /// The CompletionButtonTheme
    struct CompletionButtonTheme: Equatable {
        
        /// The background color
        public var backgroundColor: UIColor
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// The corner radius
        public var cornerRadius: CGFloat
        
        /// Default intializer
        ///
        /// - Parameters:
        ///   - backgroundColor: The background color
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        ///   - cornerRadius: The corner radius
        public init(backgroundColor: UIColor,
                    titleFont: UIFont,
                    titleColor: UIColor,
                    cornerRadius: CGFloat) {
            self.backgroundColor = backgroundColor
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.cornerRadius = cornerRadius
        }
        
    }
    
}
