//
//  UIImage+Tint.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 01.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// Tint Image with Color
    ///
    /// - Parameter color: The Color
    /// - Returns: The tinted UIImage
    func tint(color: UIColor) -> UIImage? {
        let image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.set()
        image.draw(in: CGRect(origin: .zero, size: self.size))
        guard let tintedImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return tintedImage
    }
    
}
