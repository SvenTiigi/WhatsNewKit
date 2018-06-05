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

// MARK: - Template Theme Template

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
                subtitleColor: .black
            ),
            detailButtonTheme: .init(
                titleFont: .systemFont(ofSize: 17),
                titleColor: .templateBlue
            ),
            completionButtonTheme: .init(
                backgroundColor: .templateBlue,
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
        darkDefault.backgroundColor = .templateDark
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
        return self.generateTemplate(self.default, .templatePurple)
    }
    
    /// Dark Purple Theme (dark background and purple tint color)
    static var darkPurple: WhatsNewViewController.Theme {
        return self.generateTemplate(self.darkDefault, .templatePurple)
    }
    
    /// White Red Theme (white background and red tint color)
    static var whiteRed: WhatsNewViewController.Theme {
        return self.generateTemplate(self.default, .templateRed)
    }
    
    /// Dard Red Theme (dark background and red tint color)
    static var darkRed: WhatsNewViewController.Theme {
        return self.generateTemplate(self.darkDefault, .templateRed)
    }
    
    /// White Green Theme (white background and green tint color)
    static var whiteGreen: WhatsNewViewController.Theme {
        return self.generateTemplate(self.default, .templateGreen)
    }
    
    /// Dard Green Theme (dark background and green tint color)
    static var darkGreen: WhatsNewViewController.Theme {
        return self.generateTemplate(self.darkDefault, .templateGreen)
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
