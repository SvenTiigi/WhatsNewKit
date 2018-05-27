//
//  WhatsNewViewController+CompletionButtonTheme.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 27.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

public extension WhatsNewViewController {
    
    /// The CompletionButtonTheme
    struct CompletionButtonTheme: Equatable {
        
        /// The background color
        public var backgroundColor: UIColor
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// The corner radius
        public var cornerRadius: CGFloat
        
        /// Default intializer
        ///
        /// - Parameters:
        ///   - backgroundColor: The background color
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        ///   - cornerRadius: The corner radius
        public init(backgroundColor: UIColor,
                    titleFont: UIFont,
                    titleColor: UIColor,
                    cornerRadius: CGFloat) {
            self.backgroundColor = backgroundColor
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.cornerRadius = cornerRadius
        }
        
    }
    
}
