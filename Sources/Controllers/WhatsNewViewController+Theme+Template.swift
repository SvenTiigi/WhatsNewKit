//
//  WhatsNewViewController+Theme+Template.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 23.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

public extension WhatsNewViewController.Theme {
    
    private static let defaultBlue = UIColor(
        red: 0,
        green: 122/255,
        blue: 1,
        alpha: 1
    )
    
    private static let defaultDark = UIColor(
        red: 20/255,
        green: 29/255,
        blue: 38/255,
        alpha: 1
    )
    
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
                textColor: .black
            ),
            detailButtonTheme: .init(
                titleFont: .systemFont(ofSize: 17),
                titleColor: self.defaultBlue
            ),
            completionButtonTheme: .init(
                backgroundColor: self.defaultBlue,
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
        darkDefault.backgroundColor = self.defaultDark
        darkDefault.titleViewTheme.titleColor = .white
        darkDefault.itemsViewTheme.titleColor = .white
        darkDefault.itemsViewTheme.textColor = .white
        return darkDefault
    }
    
    /// White Orange Theme (white background and orange tint color)
    static var whiteOrange: WhatsNewViewController.Theme {
        var whiteOrange = self.default
        whiteOrange.backgroundColor = .white
        whiteOrange.titleViewTheme.titleColor = .black
        whiteOrange.itemsViewTheme.titleColor = .black
        whiteOrange.itemsViewTheme.textColor = .black
        whiteOrange.detailButtonTheme.titleColor = .orange
        whiteOrange.completionButtonTheme.backgroundColor = .orange
        return whiteOrange
    }
    
    /// Dark Orange Theme (dark background and orange tint color)
    static var darkOrange: WhatsNewViewController.Theme {
        var whiteOrange = self.default
        whiteOrange.backgroundColor = self.defaultDark
        whiteOrange.titleViewTheme.titleColor = .white
        whiteOrange.itemsViewTheme.titleColor = .white
        whiteOrange.itemsViewTheme.textColor = .white
        whiteOrange.detailButtonTheme.titleColor = .orange
        whiteOrange.completionButtonTheme.backgroundColor = .orange
        return whiteOrange
    }
    
}
