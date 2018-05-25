//
//  UIColor+isLight.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 25.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Retrieve Boolean if UIColor is light
    var isLight: Bool {
        var white: CGFloat = 0
        self.getWhite(&white, alpha: nil)
        return white > 0.5
    }
    
}
