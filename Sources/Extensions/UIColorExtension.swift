//
//  UIColorExtension.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 23.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Boolean if color is light
    var isLight: Bool {
        var white: CGFloat = 0
        self.getWhite(&white, alpha: nil)
        return white > 0.5
    }
    
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
    
}
