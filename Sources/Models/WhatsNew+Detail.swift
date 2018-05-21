//
//  WhatsNew+Detail.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 21.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Detail

public extension WhatsNew {
    
    /// The Detail
    struct Detail: Codable, Equatable {
        
        // MARK: Properties
        
        /// The URL
        public let url: String
        
        /// The Button
        public let button: Button
        
        /// The Configuration
        public var configuration: Configuration = .init()

        /// The CodingKeys
        enum CodingKeys: CodingKey {
            case url
            case button
        }
        
        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - url: The URL
        ///   - button: The Button
        ///   - configuration: The Configuration
        public init(url: String,
                    button: Button,
                    configuration: Configuration = .init()) {
            self.url = url
            self.button = button
            self.configuration = configuration
        }
        
        /// Initializer with Decoder
        ///
        /// - Parameter decoder: The Decoder
        /// - Throws: If decoding fails
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.url = try container.decode(String.self, forKey: .url)
            self.button = try container.decode(Button.self, forKey: .button)
        }
        
        // MARK: Encode
        
        /// Encode
        ///
        /// - Parameter encoder: The Encoder
        /// - Throws: If encoding fails
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.url, forKey: .url)
            try container.encode(self.button, forKey: .button)
        }
        
    }
    
}

// MARK: - Configuration

public extension WhatsNew.Detail {
    
    /// The Detail Configuration
    struct Configuration: Equatable {
        
        /// The tint color
        public var tintColor: UIColor
        
        /// Default initializer
        ///
        /// - Parameter tintColor: The tint color
        public init(tintColor: UIColor = .orange) {
            self.tintColor = tintColor
        }
        
    }
    
}
