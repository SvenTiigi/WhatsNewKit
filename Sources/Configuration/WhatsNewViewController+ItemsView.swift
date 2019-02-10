//
//  WhatsNewViewController+ItemsView.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 06.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - ItemsView

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
        
        /// The ImageSize
        public var imageSize: ImageSize
        
        /// Boolean if Image should be auto tinted
        public var autoTintImage: Bool
        
        /// The Layout
        public var layout: Layout
        
        /// The ContentMode
        public var contentMode: ContentMode
        
        /// The Animation
        public var animation: Animation?
        
        /// The Insets
        public var insets: UIEdgeInsets
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font. Default value `size: 17, weight: semibold`
        ///   - titleColor: The title color. Default value `black`
        ///   - subtitleFont: The subtitle font. Default value `size: 17`
        ///   - subtitleColor: The subtitle color. Default value `black`
        ///   - imageSize: The ImageSize. Default value `preferred`
        ///   - autoTintImage: The autoTintImage boolean. Default value `true`
        ///   - layout: The Layout. Default value `default`
        ///   - contentMode: The ContentMode. Default value `top`
        ///   - animation: The Animation. Default value `nil`
        ///   - insets: The UIEdgeInsets. Default value `top: 15, left: 20, bottom: 5, right: 20`
        public init(titleFont: UIFont = .systemFont(ofSize: 17, weight: .semibold),
                    titleColor: UIColor = .black,
                    subtitleFont: UIFont = .systemFont(ofSize: 17),
                    subtitleColor: UIColor = .black,
                    imageSize: ImageSize = .preferred,
                    autoTintImage: Bool = true,
                    layout: Layout = .default,
                    contentMode: ContentMode = .top,
                    animation: Animation? = nil,
                    insets: UIEdgeInsets = .init(top: 15, left: 20, bottom: 5, right: 20)) {
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.subtitleFont = subtitleFont
            self.subtitleColor = subtitleColor
            self.imageSize = imageSize
            self.autoTintImage = autoTintImage
            self.layout = layout
            self.contentMode = contentMode
            self.animation = animation
            self.insets = insets
        }
        
    }
    
}

// MARK: - ItemsView.Layout

public extension WhatsNewViewController.ItemsView {
    
    /// The Layout
    enum Layout: String, Codable, Equatable, Hashable, CaseIterable {
        /// Default left image right text
        case `default`
        /// Centered image and centered text
        case centered
    }
    
}

// MARK: - ItemsView.ContentMode

public extension WhatsNewViewController.ItemsView {
    
    /// The ContentMode
    enum ContentMode: String, Codable, Equatable, Hashable, CaseIterable {
        /// Top
        case top
        /// Center
        case center
        /// Fill
        case fill
    }
    
}

// MARK: - ItemsView.ImageSize

public extension WhatsNewViewController.ItemsView {
    
    /// The ImageSize
    enum ImageSize: Equatable, Hashable {
        /// The original Image Size
        case original
        /// The preferred Image Size
        case preferred
        /// A fixed height by keeping the aspect ratio
        case fixed(height: Double)
    }
    
}
