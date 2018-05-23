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
        
        /// The animator
        public var animator: Animator
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        ///   - textFont: The text font
        ///   - textColor: The text color
        ///   - animator: The Animator
        public init(titleFont: UIFont,
                    titleColor: UIColor,
                    textFont: UIFont,
                    textColor: UIColor,
                    animator: Animator) {
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.textFont = textFont
            self.textColor = textColor
            self.animator = animator
        }
        
    }
    
}

// MARK: - ItemsViewTheme Animator

public extension WhatsNewViewController.Theme.ItemsViewTheme {
    
    /// The Animator
    enum Animator {
        /// None
        case none
        /// Default
        case `default`
        /// Custom Animation
        case custom(animation: Animation)
    }
    
}

// MARK: - ItemsViewTheme Animation Typealias

public extension WhatsNewViewController.Theme.ItemsViewTheme {
    
    /// The Animation typealias closure with UIView and Item count
    typealias Animation = (UIView, Int) -> Void
    
}

// MARK: - ItemsViewTheme Animator Equatable

extension WhatsNewViewController.Theme.ItemsViewTheme.Animator: Equatable {
    
    public static func == (lhs: WhatsNewViewController.Theme.ItemsViewTheme.Animator,
                           rhs: WhatsNewViewController.Theme.ItemsViewTheme.Animator) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.default, .default):
            return true
        case (.custom, .custom):
            return true
        default:
            return false
        }
    }
    
}

// MARK: - ItemsViewTheme Animator RawRepresentable

extension WhatsNewViewController.Theme.ItemsViewTheme.Animator: RawRepresentable {

    /// Associated type RawValue as optional Animation
    public typealias RawValue = WhatsNewViewController.Theme.ItemsViewTheme.Animation?

    /// RawRepresentable initializer. Which always returns nil
    ///
    /// - Parameters:
    ///   - rawValue: The rawValue
    public init?(rawValue: RawValue) {
        return nil
    }

    /// The optional Animation rawValue
    public var rawValue: RawValue {
        switch self {
        case .none:
            return nil
        case .default:
            return { view, index in
                view.alpha = 0.0
                view.transform = CGAffineTransform(
                    translationX: 0,
                    y: view.frame.size.height / 2
                )
                UIView.animate(
                    withDuration: 0.5,
                    delay: 0.10 * (Double(index) + 1.0),
                    options: .curveEaseInOut,
                    animations: {
                        view.transform = .identity
                        view.alpha = 1.0
                })
            }
        case .custom(animation: let animation):
            return animation
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
