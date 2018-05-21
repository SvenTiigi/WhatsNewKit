//
//  WhatsNew+Title.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 21.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Title

public extension WhatsNew {
    
    /// The Title
    struct Title: Codable, Equatable {
        
        // MARK: Properties
        
        /// The text
        public let text: String
        
        /// The Configuration
        public var configuration: Configuration = .init()
        
        /// The CodingKexs
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

extension WhatsNew.Title: ExpressibleByStringLiteral {
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: String) {
        self.text = value
    }
    
}

// MARK: - Configuration

public extension WhatsNew.Title {
    
    /// The Title Configuration
    struct Configuration: Equatable {
        
        /// The text font
        public var textFont: UIFont
        
        /// The text color
        public var textColor: UIColor
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - textFont: The font. Default value `size: 25, weight: .semibold`
        ///   - textColor: The text color. Default value: `.black`
        public init(textFont: UIFont = .systemFont(ofSize: 25, weight: .semibold),
                    textColor: UIColor = .black) {
            self.textFont = textFont
            self.textColor = textColor
        }
        
    }
    
}
