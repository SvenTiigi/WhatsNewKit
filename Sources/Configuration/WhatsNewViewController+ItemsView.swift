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
        ///   - titleColor: The title color. Default value `.whatsNewKitForeground`
        ///   - subtitleFont: The subtitle font. Default value `size: 17`
        ///   - subtitleColor: The subtitle color. Default value `.whatsNewKitForeground`
        ///   - imageSize: The ImageSize. Default value `preferred`
        ///   - autoTintImage: The autoTintImage boolean. Default value `true`
        ///   - layout: The Layout. Default value `left`
        ///   - contentMode: The ContentMode. Default value `top`
        ///   - animation: The Animation. Default value `nil`
        ///   - insets: The UIEdgeInsets. Default value `top: 15, left: 20, bottom: 5, right: 20`
        public init(
            titleFont: UIFont = .systemFont(ofSize: 17, weight: .semibold),
            titleColor: UIColor = .whatsNewKitForeground,
            subtitleFont: UIFont = .systemFont(ofSize: 17),
            subtitleColor: UIColor = .whatsNewKitForeground,
            imageSize: ImageSize = .preferred,
            autoTintImage: Bool = true,
            layout: Layout = .left,
            contentMode: ContentMode = .top,
            animation: Animation? = nil,
            insets: UIEdgeInsets = .init(top: 15, left: 20, bottom: 5, right: 20)
        ) {
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
        /// Left image and right aligned text
        case left
        /// Centered image and centered text
        case centered
        /// Right image and left  aligned text
        case right
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
        /// A fixed height by keeping the aspect ratio
        case fixed(height: Double)
    }
    
}

// MARK: - ItemsView.ImageSize+preferred

public extension WhatsNewViewController.ItemsView.ImageSize {
    
    /// The preferred Image Size `.fixed(height: 50)`
    static let preferred: WhatsNewViewController.ItemsView.ImageSize = .fixed(height: 50)
    
}
