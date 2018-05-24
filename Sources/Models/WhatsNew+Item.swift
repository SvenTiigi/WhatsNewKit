//
//  WhatsNew+Item.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Item

public extension WhatsNew {
    
    /// The Item
    struct Item: Codable, Equatable {
        
        // MARK: Properties
        
        /// The Title
        public let title: String
        
        /// The Text
        public let text: String
        
        /// The Image
        public let image: UIImage?
        
        // swiftlint:disable nesting
        /// The CodingKeys
        enum CodingKeys: CodingKey {
            /// title
            case title
            /// text
            case text
            /// image
            case image
        }
        // swiftlint:enable nestings
        
        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - title: The Title
        ///   - text: The Text
        ///   - image: The Image
        public init(title: String,
                    text: String,
                    image: UIImage?) {
            self.title = title
            self.text = text
            self.image = image
        }
        
        /// Initializer with Decoder
        ///
        /// - Parameter decoder: The Decoder
        /// - Throws: If decoding fails
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.title = try container.decode(String.self, forKey: .title)
            self.text = try container.decode(String.self, forKey: .text)
            if let base64 = try container.decodeIfPresent(String.self, forKey: .image) {
                self.image = Data(base64Encoded: base64, options: .ignoreUnknownCharacters).flatMap(UIImage.init)
            } else {
                self.image = nil
            }
        }
        
        // MARK: Encode
        
        /// Encode
        ///
        /// - Parameter encoder: The Encoder
        /// - Throws: If encoding fails
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.title, forKey: .title)
            try container.encode(self.text, forKey: .text)
            if let image = self.image, let data = UIImagePNGRepresentation(image) {
                let base64 = data.base64EncodedString(options: .lineLength64Characters)
                try container.encode(base64, forKey: .image)
            }
        }
        
    }
    
}
