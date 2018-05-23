//
//  UIColor+Light.swift
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
    
}
