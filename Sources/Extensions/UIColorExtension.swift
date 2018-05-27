//
//  UIColorExtension.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 25.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - isLight

extension UIColor {
    
    /// Retrieve Boolean if UIColor is light
    var isLight: Bool {
        var white: CGFloat = 0
        self.getWhite(&white, alpha: nil)
        return white > 0.5
    }
    
}

// MARK: - Template Colors

extension UIColor {
    
    /// The template blue color
    static let templateBlue = UIColor(
        red: 0,
        green: 122/255,
        blue: 1,
        alpha: 1
    )
    
    /// The template dark color
    static let templateDark = UIColor(
        red: 20/255,
        green: 29/255,
        blue: 38/255,
        alpha: 1
    )
    
    /// The template purple color
    static let templatePurple = UIColor(
        red: 183/255,
        green: 35/255,
        blue: 1,
        alpha: 1
    )
    
    /// The template red color
    static let templateRed = UIColor(
        red: 1,
        green: 45/255,
        blue: 85/255,
        alpha: 1
    )
    
    /// The template green color
    static let templateGreen = UIColor(
        red: 76/255,
        green: 217/255,
        blue: 100/255,
        alpha: 1
    )
    
}
