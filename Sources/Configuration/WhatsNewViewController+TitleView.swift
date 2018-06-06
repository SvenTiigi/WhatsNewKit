//
//  WhatsNewViewController+TitleView.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 06.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

public extension WhatsNewViewController {
    
    /// The TitleView
    struct TitleView: Equatable {
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// The Animation
        public var animation: Animation?
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font. Default value `size: 30, weight: semibold`
        ///   - titleColor: The title color. Default value `.black`
        ///   - animation: The Animation. Default value `nil`
        public init(titleFont: UIFont = .systemFont(ofSize: 30, weight: .semibold),
                    titleColor: UIColor = .black,
                    animation: Animation? = nil) {
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.animation = animation
        }
        
    }
    
}
