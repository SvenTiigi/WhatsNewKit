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
        
        /// The Layout
        public var layout: Layout
        
        /// The Animation
        public var animation: Animation?
        
        /// The Spacing
        public var spacing: Spacing
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font. Default value `size: 17, weight: semibold`
        ///   - titleColor: The title color. Default value `black`
        ///   - subtitleFont: The subtitle font. Default value `size: 17`
        ///   - subtitleColor: The subtitle color. Default value `black`
        ///   - autoTintImage: The autoTintImage boolean. Default value `true`
        ///   - layout: The Layout. Default value `default`
        ///   - animation: The Animation. Default value `nil`
        ///   - spacing: The Spacing. Default value `default`
        public init(titleFont: UIFont = .systemFont(ofSize: 17, weight: .semibold),
                    titleColor: UIColor = .black,
                    subtitleFont: UIFont = .systemFont(ofSize: 17),
                    subtitleColor: UIColor = .black,
                    autoTintImage: Bool = true,
                    layout: Layout = .default,
                    animation: Animation? = nil,
                    spacing: Spacing = .default) {
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.subtitleFont = subtitleFont
            self.subtitleColor = subtitleColor
            self.autoTintImage = autoTintImage
            self.layout = layout
            self.animation = animation
            self.spacing = spacing
        }
        
    }
    
}

// MARK: - ItemsView.Layout

public extension WhatsNewViewController.ItemsView {
    
    /// The Layout
    enum Layout: Equatable {
        /// Default left image right text
        case `default`
        /// Centered image and centered text
        case centered
    }
    
}

// MARK: - ItemsView.Spacing

public extension WhatsNewViewController.ItemsView {
    
    /// The Spacing between ItemViews
    enum Spacing: Equatable {
        /// Default will apply no spacing between the ItemViews
        case `default`
        /// Apply a fixed spacing between ItemViews
        case fixed(Double)
        /// Automatically calculate the appropriate spacing to fill the View
        case automatic
    }
    
}
