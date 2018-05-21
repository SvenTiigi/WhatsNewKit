//
//  WhatsNew+Detail+Action.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 21.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Button

public extension WhatsNew.Detail {
    
    /// The Detail Button
    struct Button: Codable, Equatable {
        
        // MARK: Properties
        
        /// The text
        public let text: String
        
        /// The Configuration
        public var configuration: Configuration = .init()
        
        /// The CodingKeys
        enum CodingKeys: CodingKey {
            case text
        }
        
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

extension WhatsNew.Detail.Button: ExpressibleByStringLiteral {
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: String) {
        self.text = value
    }
    
}

// MARK: - Configuration

public extension WhatsNew.Detail.Button {
    
    /// The DetailAction Configuration
    struct Configuration: Equatable {
        
        /// The text font
        public var textFont: UIFont
        
        /// The text color
        public var textColor: UIColor
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - textFont: The text font
        ///   - textColor: The text color
        public init(textFont: UIFont = .systemFont(ofSize: 17),
                    textColor: UIColor = .orange) {
            self.textFont = textFont
            self.textColor = textColor
        }
        
    }
    
}
