//
//  WhatsNewViewController+DetailButtonTheme.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 27.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - DetailButtonTheme

public extension WhatsNewViewController {
    
    /// The DetailButtonTheme
    struct DetailButtonTheme: Equatable {
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        public init(titleFont: UIFont,
                    titleColor: UIColor) {
            self.titleFont = titleFont
            self.titleColor = titleColor
        }
        
    }
    
}
