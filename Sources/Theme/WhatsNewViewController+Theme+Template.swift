//
//  WhatsNewViewController+Theme+Template.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 23.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

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
