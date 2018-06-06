//
//  WhatsNewViewController+ItemsView.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 06.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

public extension WhatsNewViewController {
    
    /// The ItemsViewTheme
    struct ItemsView: Equatable {
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// The subtitle font
        public var subtitleFont: UIFont
        
        /// The subtitle color
        public var subtitleColor: UIColor
        
        /// Boolean if Image should be auto tinted
        public var autoTintImage: Bool
        
        /// The Animation
        public var animation: Animation?
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font. Default value `size: 17, weight: semibold`
        ///   - titleColor: The title color. Default value `black`
        ///   - subtitleFont: The subtitle font. Default value `size: 17`
        ///   - subtitleColor: The subtitle color. Default value `black`
        ///   - autoTintImage: The autoTintImage boolean. Default value `true`
        ///   - animation: The Animation. Default value `nil`
        public init(titleFont: UIFont = .systemFont(ofSize: 17, weight: .semibold),
                    titleColor: UIColor = .black,
                    subtitleFont: UIFont = .systemFont(ofSize: 17),
                    subtitleColor: UIColor = .black,
                    autoTintImage: Bool = true,
                    animation: Animation? = nil) {
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.subtitleFont = subtitleFont
            self.subtitleColor = subtitleColor
            self.autoTintImage = autoTintImage
            self.animation = animation
        }
        
    }
    
}
