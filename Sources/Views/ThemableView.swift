//
//  ThemableView.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 23.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The ThemableView
class ThemableView: UIView {
    
    /// The Theme
    var theme: WhatsNewViewController.Theme
    
    /// Theme initializer
    ///
    /// - Parameter theme: The Theme
    init(theme: WhatsNewViewController.Theme) {
        // Set Theme
        self.theme = theme
        // Super init zero frame
        super.init(frame: .zero)
    }
    
    /// Initializer with Coder always returns nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
}
