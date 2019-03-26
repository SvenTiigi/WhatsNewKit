//
//  WhatsNewViewController+Configuration.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 24.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Configuration

public extension WhatsNewViewController {
    
    /// The WhatsNewViewController Configuration
    struct Configuration {
        
        // MARK: Properties
        
        /// The background color
        public var backgroundColor: UIColor

        /// The TitleView
        public var titleView: TitleView
        
        /// The ItemsView
        public var itemsView: ItemsView
        
        /// The optional DetailButton
        public var detailButton: DetailButton?
        
        /// The CompletionButton
        public var completionButton: CompletionButton
        
        /// The iPad Adjustment Closure
        public var padAdjustment: PadAdjustment
        
        /// The tint color based on completionButtonTheme backgroundcolor
        public var tintColor: UIColor {
            return self.completionButton.backgroundColor
        }

        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - theme: The Theme. Default value `.default`
        ///   - backgroundColor: The background color. Default value `.white`
        ///   - titleView: The TitleView. Default value `.init()`
        ///   - itemsView: The ItemsView. Default value `.init()`
        ///   - detailButton: The optional DetailButton. Default value `nil`
        ///   - completionButton: The completion button. Default value `.init()`
        ///   - padAdjustment: The The iPad Adjustment Closure. Default value `defaultPadAdjustment`
        public init(theme: Theme = .default,
                    backgroundColor: UIColor = .white,
                    titleView: TitleView = .init(),
                    itemsView: ItemsView = .init(),
                    detailButton: DetailButton? = nil,
                    completionButton: CompletionButton = .init(),
                    padAdjustment: @escaping PadAdjustment = Configuration.defaultPadAdjustment) {
            self.backgroundColor = backgroundColor
            self.titleView = titleView
            self.itemsView = itemsView
            self.detailButton = detailButton
            self.completionButton = completionButton
            self.padAdjustment = padAdjustment
            self.apply(theme: theme)
        }
        
        /// Convenience Initializer with Theme
        ///
        /// - Parameter theme: The Theme
        public init(_ theme: Theme) {
            self.init(theme: theme)
        }
        
    }
    
}

// MARK: - PadAdjustment

public extension WhatsNewViewController.Configuration {
    
    /// The Pad Adjustment Closure
    typealias PadAdjustment = (inout WhatsNewViewController.Configuration) -> Void
    
    /// The default iPad Adjustment closure
    static let defaultPadAdjustment: PadAdjustment = { configuration in
        // Increase TitleView Insets
        configuration.titleView.insets.top *= 1.5
        configuration.titleView.insets.left *= 2
        configuration.titleView.insets.right *= 2
        configuration.titleView.insets.bottom *= 2
        // Increase ItemsView Insets
        configuration.itemsView.insets.top *= 2
        configuration.itemsView.insets.left *= 5
        configuration.itemsView.insets.right *= 5
        configuration.itemsView.insets.bottom *= 2
        // Increase CompletionButton Insets
        configuration.completionButton.insets.top *= 4
        configuration.completionButton.insets.left *= 5
        configuration.completionButton.insets.right *= 5
        configuration.completionButton.insets.bottom *= 2.5
    }
    
}

// MARK: - Configuration Apply Functions

public extension WhatsNewViewController.Configuration {
    
    /// Apply Theme to Configuration
    ///
    /// - Parameter theme: The Theme
    /// - Returns: Discardable Configuration
    @discardableResult
    mutating func apply(theme: WhatsNewViewController.Theme) -> WhatsNewViewController.Configuration {
        // Perform Customization
        theme.customization(&self)
        // Return self
        return self
    }
    
    /// Apply a given Animation to all Views
    ///
    /// - Parameter animation: The Animation
    /// - Returns: Discardable Configuration
    @discardableResult
    mutating func apply(animation: WhatsNewViewController.Animation) -> WhatsNewViewController.Configuration {
        self.titleView.animation = animation
        self.itemsView.animation = animation
        self.detailButton?.animation = animation
        self.completionButton.animation = animation
        return self
    }
    
    /// Apply a given UIColor as text color to all Views
    ///
    /// - Parameter textColor: The text color
    /// - Returns: Discardable Configuration
    @discardableResult
    mutating func apply(textColor: UIColor) -> WhatsNewViewController.Configuration {
        self.titleView.titleColor = textColor
        self.itemsView.titleColor = textColor
        self.itemsView.subtitleColor = textColor
        return self
    }
    
}

// MARK: - Theme

public extension WhatsNewViewController {
    
    /// The Customization typealias for an inout Configuration closure
    typealias Customization = (inout Configuration) -> Void
    
    /// The Theme
    struct Theme {
        
        /// The Customization closure
        let customization: Customization
        
        /// Default initializer
        ///
        /// - Parameter customization: The Customization
        public init(customization: @escaping Customization) {
            self.customization = customization
        }
        
    }
    
}

// MARK: - Template Themes

public extension WhatsNewViewController.Theme {
    
    /// Default Theme (white background and blue tint color)
    static var `default`: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .white
            configuration.titleView.titleFont = .systemFont(ofSize: 30, weight: .semibold)
            configuration.titleView.titleColor = .black
            configuration.itemsView.titleFont = .systemFont(ofSize: 17, weight: .semibold)
            configuration.itemsView.titleColor = .black
            configuration.itemsView.subtitleFont = .systemFont(ofSize: 17)
            configuration.itemsView.subtitleColor = .black
            configuration.detailButton?.titleFont = .systemFont(ofSize: 17)
            configuration.detailButton?.titleColor = .whatsNewKitBlue
            configuration.completionButton.backgroundColor = .whatsNewKitBlue
            configuration.completionButton.titleFont = .systemFont(ofSize: 17, weight: .semibold)
            configuration.completionButton.titleColor = .white
            configuration.completionButton.cornerRadius = 8.0
        }
    }
    
    /// Dark Default Theme (dark background and blue tint color)
    static var darkDefault: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.apply(theme: .default)
            configuration.apply(textColor: .white)
            configuration.backgroundColor = .whatsNewKitDark
        }
    }
    
    /// White LightBlue Theme (white background and light blue tint color)
    static var whiteLightBlue: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .default,
                tintColor: .whatsNewKitLightBlue
            )
        }
    }
    
    /// Dark LightBlue Theme (dark background and light blue tint color)
    static var darkLightBlue: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .darkDefault,
                tintColor: .whatsNewKitLightBlue
            )
        }
    }
    
    /// White Orange Theme (white background and orange tint color)
    static var whiteOrange: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .default,
                tintColor: .orange
            )
        }
    }
    
    /// Dark Orange Theme (dark background and orange tint color)
    static var darkOrange: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .darkDefault,
                tintColor: .orange
            )
        }
    }
    
    /// White Purple Theme (white background and purple tint color)
    static var whitePurple: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .default,
                tintColor: .whatsNewKitPurple
            )
        }
    }
    
    /// Dark Purple Theme (dark background and purple tint color)
    static var darkPurple: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .darkDefault,
                tintColor: .whatsNewKitPurple
            )
        }
    }
    
    /// White Red Theme (white background and red tint color)
    static var whiteRed: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .default,
                tintColor: .whatsNewKitRed
            )
        }
    }
    
    /// Dard Red Theme (dark background and red tint color)
    static var darkRed: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .darkDefault,
                tintColor: .whatsNewKitRed
            )
        }
    }
    
    /// White Green Theme (white background and green tint color)
    static var whiteGreen: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .default,
                tintColor: .whatsNewKitGreen
            )
        }
    }
    
    /// Dard Green Theme (dark background and green tint color)
    static var darkGreen: WhatsNewViewController.Theme {
        return .init { configuration in
            self.customize(
                configuration: &configuration,
                theme: .darkDefault,
                tintColor: .whatsNewKitGreen
            )
        }
    }
    
    /// Customize Configuration with Theme and TintColor
    ///
    /// - Parameters:
    ///   - configuration: The Configuration
    ///   - theme: The Theme
    ///   - tintColor: The TintColor
    private static func customize(configuration: inout WhatsNewViewController.Configuration,
                                  theme: WhatsNewViewController.Theme,
                                  tintColor: UIColor) {
        configuration.apply(theme: theme)
        configuration.detailButton?.titleColor = tintColor
        configuration.completionButton.backgroundColor = tintColor
    }
    
}
