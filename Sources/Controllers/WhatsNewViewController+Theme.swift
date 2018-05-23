//
//  WhatsNewViewController+Theme.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 22.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Theme

public extension WhatsNewViewController {
    
    /// The Theme
    struct Theme: Equatable {
        
        /// The background color
        public var backgroundColor: UIColor
        
        /// The title view thrme
        public var titleViewTheme: TitleViewTheme
        
        /// The items view theme
        public var itemsViewTheme: ItemsViewTheme
        
        /// The detail button theme
        public var detailButtonTheme: DetailButtonTheme
        
        /// The completion button theme
        public var completionButtonTheme: CompletionButtonTheme
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - backgroundColor: The background color
        ///   - titleViewTheme: The TitleViewTheme
        ///   - itemsViewTheme: The ItemsViewTheme
        ///   - detailButtonTheme: The DetailButtonTheme
        ///   - completionButtonTheme: The CompletionButtonTheme
        public init(backgroundColor: UIColor,
                    titleViewTheme: TitleViewTheme,
                    itemsViewTheme: ItemsViewTheme,
                    detailButtonTheme: DetailButtonTheme,
                    completionButtonTheme: CompletionButtonTheme) {
            self.backgroundColor = backgroundColor
            self.titleViewTheme = titleViewTheme
            self.itemsViewTheme = itemsViewTheme
            self.detailButtonTheme = detailButtonTheme
            self.completionButtonTheme = completionButtonTheme
        }
        
    }
    
}

// MARK: - TitleViewTheme

public extension WhatsNewViewController.Theme {
    
    /// The TitleViewTheme
    struct TitleViewTheme: Equatable {
        
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

// MARK: - ItemsViewTheme

public extension WhatsNewViewController.Theme {
    
    /// The ItemsViewTheme
    struct ItemsViewTheme: Equatable {
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        /// The text font
        public var textFont: UIFont
        
        /// The text color
        public var textColor: UIColor
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font
        ///   - titleColor: The title color
        ///   - textFont: The text font
        ///   - textColor: The text color
        public init(titleFont: UIFont,
                    titleColor: UIColor,
                    textFont: UIFont,
                    textColor: UIColor) {
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.textFont = textFont
            self.textColor = textColor
        }
        
    }
    
}

// MARK: - DetailButtonTheme

public extension WhatsNewViewController.Theme {
    
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

// MARK: - CompletionButtonTheme

public extension WhatsNewViewController.Theme {
    
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
