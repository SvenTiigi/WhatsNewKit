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
    struct Configuration {
        
        // MARK: Properties
      
        /// Specifies whether the WhatsNewViewController prefers the status bar to be hidden or shown.
        public var prefersStatusBarHidden: Bool
        
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
        
        /// The iPad Adjustment Closure
        public var padAdjustment: PadAdjustment
        
        /// The tint color based on completionButtonTheme backgroundcolor
        public var tintColor: UIColor {
            set {
                self.detailButton?.titleColor = newValue
                self.completionButton.backgroundColor = newValue
            }
            get {
                return self.completionButton.backgroundColor
            }
        }
        
        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - theme: The Theme. Default value `.default`
        ///   - prefersStatusBarHidden: Bool value if  the status bar should be  be hidden or shown. Default value `.false`
        ///   - backgroundColor: The background color. Default value `.whatsNewKitBackground`
        ///   - titleView: The TitleView. Default value `.init()`
        ///   - itemsView: The ItemsView. Default value `.init()`
        ///   - detailButton: The optional DetailButton. Default value `nil`
        ///   - completionButton: The completion button. Default value `.init()`
        ///   - padAdjustment: The The iPad Adjustment Closure. Default value `defaultPadAdjustment`
        public init(
            theme: Theme = .default,
            prefersStatusBarHidden: Bool = false,
            backgroundColor: UIColor = .whatsNewKitBackground,
            titleView: TitleView = .init(),
            itemsView: ItemsView = .init(),
            detailButton: DetailButton? = nil,
            completionButton: CompletionButton = .init(),
            padAdjustment: @escaping PadAdjustment = Configuration.defaultPadAdjustment
        ) {
            self.prefersStatusBarHidden = prefersStatusBarHidden
            self.backgroundColor = backgroundColor
            self.titleView = titleView
            self.itemsView = itemsView
            self.detailButton = detailButton
            self.completionButton = completionButton
            self.padAdjustment = padAdjustment
            self.apply(theme: theme)
        }
        
        /// Convenience Initializer with Theme
        ///
        /// - Parameter theme: The Theme
        public init(_ theme: Theme) {
            self.init(theme: theme)
        }
        
    }
    
}

// MARK: - PadAdjustment

public extension WhatsNewViewController.Configuration {
    
    /// The Pad Adjustment Closure
    typealias PadAdjustment = (inout WhatsNewViewController.Configuration) -> Void
    
    /// The default iPad Adjustment closure
    static let defaultPadAdjustment: PadAdjustment = { configuration in
        // Increase TitleView Insets
        configuration.titleView.insets.top *= 1.5
        configuration.titleView.insets.left *= 2
        configuration.titleView.insets.right *= 2
        configuration.titleView.insets.bottom *= 2
        // Increase ItemsView Insets
        configuration.itemsView.insets.top *= 2
        configuration.itemsView.insets.left *= 5
        configuration.itemsView.insets.right *= 5
        configuration.itemsView.insets.bottom *= 2
        // Increase CompletionButton Insets
        configuration.completionButton.insets.top *= 4
        configuration.completionButton.insets.left *= 5
        configuration.completionButton.insets.right *= 5
        configuration.completionButton.insets.bottom *= 2.5
    }
    
}

// MARK: - Configuration Apply Functions

public extension WhatsNewViewController.Configuration {
    
    /// Apply Theme to Configuration
    ///
    /// - Parameter theme: The Theme
    /// - Returns: Discardable Configuration
    @discardableResult
    mutating func apply(
        theme: WhatsNewViewController.Theme
    ) -> WhatsNewViewController.Configuration {
        // Perform Customization
        theme.customization(&self)
        // Return self
        return self
    }
    
    /// Apply a given Animation to all Views
    ///
    /// - Parameter animation: The Animation
    /// - Returns: Discardable Configuration
    @discardableResult
    mutating func apply(
        animation: WhatsNewViewController.Animation
    ) -> WhatsNewViewController.Configuration {
        self.titleView.animation = animation
        self.itemsView.animation = animation
        self.detailButton?.animation = animation
        self.completionButton.animation = animation
        return self
    }
    
    /// Apply a given UIColor as text color to all Views
    ///
    /// - Parameter textColor: The text color
    /// - Returns: Discardable Configuration
    @discardableResult
    mutating func apply(
        textColor: UIColor
    ) -> WhatsNewViewController.Configuration {
        self.titleView.titleColor = textColor
        self.itemsView.titleColor = textColor
        self.itemsView.subtitleColor = textColor
        return self
    }
    
}
