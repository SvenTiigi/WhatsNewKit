//
//  WhatsNew+Theme.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 22.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Theme

extension WhatsNew {
    
    /// The WhatsNew Theme
    open class Theme {
        
        /// The background color
        public let backgroundColor: UIColor
        
        /// The text color
        public let textColor: UIColor
        
        /// The tint color
        public let tintColor: UIColor
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - backgroundColor: The background color
        ///   - textColor: The text color
        ///   - tintColor: The tint color
        public init(backgroundColor: UIColor,
                    textColor: UIColor,
                    tintColor: UIColor) {
            self.backgroundColor = backgroundColor
            self.textColor = textColor
            self.tintColor = tintColor
        }
        
    }
    
}

// MARK: - Equatable

extension WhatsNew.Theme: Equatable {
    
    public static func == (lhs: WhatsNew.Theme, rhs: WhatsNew.Theme) -> Bool {
        return lhs.backgroundColor == rhs.backgroundColor
            && lhs.textColor == rhs.textColor
            && lhs.tintColor == rhs.tintColor
    }
    
}

// MARK: - Theme Defaults

public extension WhatsNew.Theme {
    
    static let whiteOrange: WhatsNew.Theme = .init(
        backgroundColor: .white,
        textColor: .black,
        tintColor: .orange
    )
    
    static let darkOrange: WhatsNew.Theme = .init(
        backgroundColor: .black,
        textColor: .white,
        tintColor: .orange
    )
    
}
