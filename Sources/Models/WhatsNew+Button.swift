//
//  WhatsNew+CompletionAction.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 21.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Button

public extension WhatsNew {
    
    /// The Button
    struct Button: Codable, Equatable {
        
        // MARK: Properties
        
        /// The text
        public let text: String
        
        /// The Configuration
        public var configuration: Configuration = .init()
        
        /// The CodingKeys
        // swiftlint:disable nesting
        enum CodingKeys: CodingKey {
            case text
        }
        // swiftlint:enable nesting
        
        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - text: The text
        ///   - configuration: The Configuration. Default value `.init()`
        public init(text: String,
                    configuration: Configuration = .init()) {
            self.text = text
            self.configuration = configuration
        }
        
        /// Initializer with Decoder
        ///
        /// - Parameter decoder: The Decoder
        /// - Throws: If decoding fails
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.text = try container.decode(String.self, forKey: .text)
        }
        
        // MARK: Encode
        
        /// Encode
        ///
        /// - Parameter encoder: The Encoder
        /// - Throws: If encoding fails
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.text, forKey: .text)
        }
        
    }
    
}

// MARK: - ExpressibleByStringLiteral

extension WhatsNew.Button: ExpressibleByStringLiteral {
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: String) {
        self.text = value
    }
    
}

// MARK: - Configuration

public extension WhatsNew.Button {
    
    struct Configuration: Equatable {
        
        /// The background color
        public var backgroundColor: UIColor = .orange
        
        /// The text color
        public var textColor: UIColor = .white
        
        /// The text font
        public var textFont: UIFont
        
        /// The corner radius
        public var cornerRadius: CGFloat
        
        /// Default intializer
        ///
        /// - Parameters:
        ///   - backgroundColor: The background color. Default value `.orange`
        ///   - textColor: The title color. Default value `.white`
        ///   - textFont: The font. Default value `size: 17, weight: .semibold`
        ///   - cornerRadius: The corner radius. Default value `8.0`
        public init(backgroundColor: UIColor = .orange,
                    textColor: UIColor = .white,
                    textFont: UIFont = .systemFont(ofSize: 17, weight: .semibold),
                    cornerRadius: CGFloat = 8.0) {
            self.backgroundColor = backgroundColor
            self.textColor = textColor
            self.textFont = textFont
            self.cornerRadius = cornerRadius
        }
        
    }
    
}
