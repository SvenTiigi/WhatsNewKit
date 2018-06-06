//
//  WhatsNewViewController+Configuration.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 24.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Configuration

public extension WhatsNewViewController {
    
    /// The WhatsNewViewController Configuration
    struct Configuration: Equatable {
        
        /// The background color
        public var backgroundColor: UIColor

        /// The TitleView
        public var titleView: TitleView
        
        /// The ItemsView
        public var itemsView: ItemsView
        
        /// The optional DetailButton
        public var detailButton: DetailButton?
        
        /// The CompletionButton
        public var completionButton: CompletionButton
        
        /// The tint color based on completionButtonTheme backgroundcolor
        public var tintColor: UIColor {
            return self.completionButton.backgroundColor
        }

        /// Default initializer
        ///
        /// - Parameters:
        ///   - theme: The Theme. Default value `.default`
        ///   - backgroundColor: The background color. Default value `.white`
        ///   - titleView: The TitleView. Default value `.init()`
        ///   - itemsView: The ItemsView. Default value `.init()`
        ///   - detailButton: The optional DetailButton. Default value `nil`
        ///   - completionButton: The completion button. Default value `.init()`
        public init(theme: Theme = .default,
                    backgroundColor: UIColor = .white,
                    titleView: TitleView = .init(),
                    itemsView: ItemsView = .init(),
                    detailButton: DetailButton? = nil,
                    completionButton: CompletionButton = .init()) {
            self.backgroundColor = backgroundColor
            self.titleView = titleView
            self.itemsView = itemsView
            self.detailButton = detailButton
            self.completionButton = completionButton
            self.apply(theme: theme)
        }
        
        /// Apply Theme to Configuration
        ///
        /// - Parameter theme: The Theme
        /// - Returns: Discardable Configuration
        @discardableResult
        public mutating func apply(theme: Theme) -> Configuration {
            // Perform Customization
            theme.customization(&self)
            // Return self
            return self
        }
        
    }
    
}

// MARK: - Theme

public extension WhatsNewViewController {
    
    /// The Customization typealias for an inout Configuration closure
    public typealias Customization = (inout Configuration) -> Void
    
    /// The Theme
    struct Theme {
        
        /// The Customization closure
        let customization: Customization
        
        /// Default initializer
        ///
        /// - Parameter customization: The Customization
        public init(customization: @escaping Customization) {
            self.customization = customization
        }
        
    }
    
}

// MARK: - Template Themes

public extension WhatsNewViewController.Theme {
    
    /// Default Theme (white background and blue tint color)
    static let `default`: WhatsNewViewController.Theme = .init { configuration in
        configuration.backgroundColor = .white
        configuration.titleView.titleFont = .systemFont(ofSize: 30, weight: .semibold)
        configuration.titleView.titleColor = .black
        configuration.itemsView.titleFont = .systemFont(ofSize: 17, weight: .semibold)
        configuration.itemsView.titleColor = .black
        configuration.itemsView.subtitleFont = .systemFont(ofSize: 17)
        configuration.itemsView.subtitleColor = .black
        configuration.detailButton?.titleFont = .systemFont(ofSize: 17)
        configuration.detailButton?.titleColor = .whatsNewKitBlue
        configuration.completionButton.backgroundColor = .whatsNewKitBlue
        configuration.completionButton.titleFont = .systemFont(ofSize: 17, weight: .semibold)
        configuration.completionButton.titleColor = .white
        configuration.completionButton.cornerRadius = 8.0
    }
    
    /// Dark Default Theme (dark background and blue tint color)
    static let darkDefault: WhatsNewViewController.Theme = .init { configuration in
        configuration.apply(theme: .default)
        configuration.backgroundColor = .whatsNewKitDark
        configuration.titleView.titleColor = .white
        configuration.itemsView.titleColor = .white
        configuration.itemsView.subtitleColor = .white
    }
    
    /// White Orange Theme (white background and orange tint color)
    static let whiteOrange: WhatsNewViewController.Theme = .init { configuration in
        configuration.apply(theme: .default)
        configuration.detailButton?.titleColor = .orange
        configuration.completionButton.backgroundColor = .orange
    }
    
    /// Dark Orange Theme (dark background and orange tint color)
    static let darkOrange: WhatsNewViewController.Theme = .init { configuration in
        configuration.apply(theme: .darkDefault)
        configuration.detailButton?.titleColor = .orange
        configuration.completionButton.backgroundColor = .orange
    }
    
    /// White Purple Theme (white background and purple tint color)
    static let whitePurple: WhatsNewViewController.Theme = .init { configuration in
        configuration.apply(theme: .default)
        configuration.detailButton?.titleColor = .whatsNewKitPurple
        configuration.completionButton.backgroundColor = .whatsNewKitPurple
    }
    
    /// Dark Purple Theme (dark background and purple tint color)
    static let darkPurple: WhatsNewViewController.Theme = .init { configuration in
        configuration.apply(theme: .darkDefault)
        configuration.detailButton?.titleColor = .whatsNewKitPurple
        configuration.completionButton.backgroundColor = .whatsNewKitPurple
    }
    
    /// White Red Theme (white background and red tint color)
    static let whiteRed: WhatsNewViewController.Theme = .init { configuration in
        configuration.apply(theme: .default)
        configuration.detailButton?.titleColor = .whatsNewKitRed
        configuration.completionButton.backgroundColor = .whatsNewKitRed
    }
    
    /// Dard Red Theme (dark background and red tint color)
    static let darkRed: WhatsNewViewController.Theme = .init { configuration in
        configuration.apply(theme: .darkDefault)
    }
    
    /// White Green Theme (white background and green tint color)
    static let whiteGreen: WhatsNewViewController.Theme = .init { configuration in
        configuration.apply(theme: .default)
        configuration.detailButton?.titleColor = .whatsNewKitGreen
        configuration.completionButton.backgroundColor = .whatsNewKitGreen
    }
    
    /// Dard Green Theme (dark background and green tint color)
    static let darkGreen: WhatsNewViewController.Theme = .init { configuration in
        configuration.apply(theme: .darkDefault)
        configuration.detailButton?.titleColor = .whatsNewKitGreen
        configuration.completionButton.backgroundColor = .whatsNewKitGreen
    }
    
}
