//
//  WhatsNew.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// WhatsNew
public struct WhatsNew: Codable, Equatable {
    
    // MARK: Properties
    
    /// The Version
    public let version: Version
    
    /// The title
    public var title: Title
    
    /// The items
    public var items: [Item]
    
    /// The Detail
    public var detail: Detail?
    
    /// The Button
    public var button: Button
    
    /// The Configuration
    public var configuration: Configuration = .init()
    
    /// The CodingKeys
    enum CodingKeys: CodingKey {
        case version
        case title
        case items
        case detail
        case button
    }
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - version: The Version
    ///   - title: The Title
    ///   - items: The Items
    ///   - detail: The optional Detail
    ///   - button: The Button
    ///   - configuration: The Configuration. Default value `.init()`
    ///   - theme: The optional Theme
    public init(version: Version,
                title: Title,
                items: Item...,
                detail: Detail? = nil,
                button: Button,
                configuration: Configuration = .init(),
                theme: Theme? = nil) {
        self.version = version
        self.title = title
        self.items = items
        self.detail = detail
        self.button = button
        self.configuration = configuration
        // Set theme if available
        theme.flatMap {
            self.set(theme: $0)
        }
    }
    
    /// Initializer with Decoder
    ///
    /// - Parameter decoder: The Decoder
    /// - Throws: If decoding fails
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = try container.decode(Version.self, forKey: .version)
        self.title = try container.decode(Title.self, forKey: .title)
        self.items = try container.decode([Item].self, forKey: .items)
        self.detail = try container.decodeIfPresent(Detail.self, forKey: .detail)
        self.button = try container.decode(Button.self, forKey: .button)
    }
    
    // MARK: Encode
    
    /// Encode
    ///
    /// - Parameter encoder: The Encoder
    /// - Throws: If encoding fails
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.items, forKey: .items)
        try container.encode(self.detail, forKey: .detail)
        try container.encode(self.button, forKey: .button)
    }
    
}

// MARK: - Set Theme

public extension WhatsNew {
    
    /// Set Theme
    ///
    /// - Parameter theme: The Theme
    mutating func set(theme: Theme) {
        self.configuration.backgroundColor = theme.backgroundColor
        self.title.configuration.textColor = theme.textColor
        self.items = self.items.map {
            var item = $0
            item.configuration.backgroundColor = theme.backgroundColor
            item.configuration.textColor = theme.textColor
            item.configuration.titleColor = theme.textColor
            return item
        }
        self.detail?.configuration.tintColor = theme.tintColor
        self.detail?.button.configuration.textColor = theme.tintColor
        self.button.configuration.backgroundColor = theme.tintColor
        self.button.configuration.textColor = theme.textColor
    }
    
}

// MARK: - Configuration

public extension WhatsNew {
    
    /// The WhatsNew Configuration
    struct Configuration: Equatable {
    
        /// The background Color
        public var backgroundColor: UIColor
        
        /// Default initializer
        ///
        /// - Parameter backgroundColor: The background color. Default value `.white`
        public init(backgroundColor: UIColor = .white) {
            self.backgroundColor = backgroundColor
        }
        
    }
    
}
