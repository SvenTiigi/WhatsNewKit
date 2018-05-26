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
        
        /// The tint color based on completionButtonTheme backgroundcolor
        public var tintColor: UIColor {
            return self.completionButtonTheme.backgroundColor
        }
        
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
        
        /// The subtitle font
        public var subtitleFont: UIFont
        
        /// The subtitle color
        public var subtitleColor: UIColor
        
        /// Boolean if Image should be auto tinted
        public var autoTintImage: Bool
        
        /// The Animation
        public var animation: Animation
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        ///   - subtitleFont: The subtitle font
        ///   - subtitleColor: The subtitle color
        ///   - autoTintImage: The autoTintImage boolean. Default value `true`
        ///   - animation: The Animation
        public init(titleFont: UIFont,
                    titleColor: UIColor,
                    subtitleFont: UIFont,
                    subtitleColor: UIColor,
                    autoTintImage: Bool = true,
                    animation: Animation) {
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

public extension WhatsNewViewController.Theme.ItemsViewTheme {
    
    /// The Animation
    enum Animation {
        /// None
        case none
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
        case .fade, .slideUp, .slideDown, .slideLeft, .slideRight:
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

// MARK: - Default Theme Template

public extension WhatsNewViewController.Theme {
    
    /// Default Theme (white background and blue tint color)
    static var `default`: WhatsNewViewController.Theme {
        return .init(
            backgroundColor: .white,
            titleViewTheme: .init(
                titleFont: .systemFont(
                    ofSize: 30,
                    weight: .semibold
                ),
                titleColor: .black)
            ,
            itemsViewTheme: .init(
                titleFont: .systemFont(
                    ofSize: 17,
                    weight: .semibold
                ),
                titleColor: .black,
                subtitleFont: .systemFont(ofSize: 17),
                subtitleColor: .black,
                animation: .none
            ),
            detailButtonTheme: .init(
                titleFont: .systemFont(ofSize: 17),
                titleColor: .defaultBlue
            ),
            completionButtonTheme: .init(
                backgroundColor: .defaultBlue,
                titleFont: .systemFont(
                    ofSize: 17,
                    weight: .semibold
                ),
                titleColor: .white,
                cornerRadius: 8.0
            )
        )
    }
    
    /// Dark Default Theme (dark background and blue tint color)
    static var darkDefault: WhatsNewViewController.Theme {
        var darkDefault = self.default
        darkDefault.backgroundColor = .defaultDark
        darkDefault.titleViewTheme.titleColor = .white
        darkDefault.itemsViewTheme.titleColor = .white
        darkDefault.itemsViewTheme.subtitleColor = .white
        return darkDefault
    }
    
}

// MARK: - Theme Templates

public extension WhatsNewViewController.Theme {
    
    /// White Orange Theme (white background and orange tint color)
    static var whiteOrange: WhatsNewViewController.Theme {
        return self.generateTemplate(self.default, .orange)
    }
    
    /// Dark Orange Theme (dark background and orange tint color)
    static var darkOrange: WhatsNewViewController.Theme {
        return self.generateTemplate(self.darkDefault, .orange)
    }
    
    /// White Purple Theme (white background and purple tint color)
    static var whitePurple: WhatsNewViewController.Theme {
        return self.generateTemplate(self.default, .defaultPurple)
    }
    
    /// Dark Purple Theme (dark background and purple tint color)
    static var darkPurple: WhatsNewViewController.Theme {
        return self.generateTemplate(self.darkDefault, .defaultPurple)
    }
    
    /// White Red Theme (white background and red tint color)
    static var whiteRed: WhatsNewViewController.Theme {
        return self.generateTemplate(self.default, .defaultRed)
    }
    
    /// Dard Red Theme (dark background and red tint color)
    static var darkRed: WhatsNewViewController.Theme {
        return self.generateTemplate(self.darkDefault, .defaultRed)
    }
    
    /// White Green Theme (white background and green tint color)
    static var whiteGreen: WhatsNewViewController.Theme {
        return self.generateTemplate(self.default, .defaultGreen)
    }
    
    /// Dard Green Theme (dark background and green tint color)
    static var darkGreen: WhatsNewViewController.Theme {
        return self.generateTemplate(self.darkDefault, .defaultGreen)
    }
    
}

// MARK: - Private Template Helper

private extension WhatsNewViewController.Theme {
    
    /// Generate Theme Template based on given Theme and tint color
    ///
    /// - Parameters:
    ///   - basedOn: The base Theme
    ///   - tintColor: The tint color
    /// - Returns: Theme Template
    static func generateTemplate(_ basedOn: WhatsNewViewController.Theme,
                                 _ tintColor: UIColor) -> WhatsNewViewController.Theme {
        var theme = basedOn
        theme.detailButtonTheme.titleColor = tintColor
        theme.completionButtonTheme.backgroundColor = tintColor
        return theme
    }
    
}

// MARK: Template Colors

private extension UIColor {
    
    /// The default blue color
    static let defaultBlue = UIColor(
        red: 0,
        green: 122/255,
        blue: 1,
        alpha: 1
    )
    
    /// The default dark color
    static let defaultDark = UIColor(
        red: 20/255,
        green: 29/255,
        blue: 38/255,
        alpha: 1
    )
    
    /// The default purple color
    static let defaultPurple = UIColor(
        red: 183/255,
        green: 35/255,
        blue: 1,
        alpha: 1
    )
    
    /// The default red color
    static let defaultRed = UIColor(
        red: 1,
        green: 45/255,
        blue: 85/255,
        alpha: 1
    )
    
    /// The default green color
    static let defaultGreen = UIColor(
        red: 76/255,
        green: 217/255,
        blue: 100/255,
        alpha: 1
    )
    
}
