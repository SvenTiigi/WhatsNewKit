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
                    ofSize: 25,
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
                textFont: .systemFont(ofSize: 17),
                textColor: .black,
                animator: .none
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
    
}

// MARK: - Theme Templates

public extension WhatsNewViewController.Theme {
    
    /// Dark Default Theme (dark background and blue tint color)
    static var darkDefault: WhatsNewViewController.Theme {
        var darkDefault = self.default
        darkDefault.backgroundColor = .defaultDark
        darkDefault.titleViewTheme.titleColor = .white
        darkDefault.itemsViewTheme.titleColor = .white
        darkDefault.itemsViewTheme.textColor = .white
        return darkDefault
    }
    
    /// White Orange Theme (white background and orange tint color)
    static var whiteOrange: WhatsNewViewController.Theme {
        var whiteOrange = self.default
        whiteOrange.detailButtonTheme.titleColor = .orange
        whiteOrange.completionButtonTheme.backgroundColor = .orange
        return whiteOrange
    }
    
    /// Dark Orange Theme (dark background and orange tint color)
    static var darkOrange: WhatsNewViewController.Theme {
        var whiteOrange = self.default
        whiteOrange.backgroundColor = .defaultDark
        whiteOrange.titleViewTheme.titleColor = .white
        whiteOrange.itemsViewTheme.titleColor = .white
        whiteOrange.itemsViewTheme.textColor = .white
        whiteOrange.detailButtonTheme.titleColor = .orange
        whiteOrange.completionButtonTheme.backgroundColor = .orange
        return whiteOrange
    }
    
    /// White Purple Theme (white background and purple tint color)
    static var whitePurple: WhatsNewViewController.Theme {
        var whitePurple = self.default
        whitePurple.detailButtonTheme.titleColor = .defaultPurple
        whitePurple.completionButtonTheme.backgroundColor = .defaultPurple
        return whitePurple
    }
    
    /// Dark Purple Theme (dark background and purple tint color)
    static var darkPurple: WhatsNewViewController.Theme {
        var darkPurple = self.default
        darkPurple.backgroundColor = .defaultDark
        darkPurple.titleViewTheme.titleColor = .white
        darkPurple.itemsViewTheme.titleColor = .white
        darkPurple.itemsViewTheme.textColor = .white
        darkPurple.detailButtonTheme.titleColor = .defaultPurple
        darkPurple.completionButtonTheme.backgroundColor = .defaultPurple
        return darkPurple
    }
    
}
