//
//  WhatsNew+Item.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - WhatsNew.Item

public extension WhatsNew {
    
    /// The Item
    struct Item: Equatable {
        
        // MARK: Properties
        
        /// The Title
        public let title: String
        
        /// The Subtitle
        public let subtitle: String
        
        /// The Image
        public let image: UIImage?
        
        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - title: The Title
        ///   - subtitle: The Subtitle
        ///   - image: The Image
        public init(title: String,
                    subtitle: String,
                    image: UIImage?) {
            self.title = title
            self.subtitle = subtitle
            self.image = image
        }
        
    }
    
}

// MARK: - Codable

extension WhatsNew.Item: Codable {
    
    /// The CodingKeys
    private enum CodingKeys: CodingKey {
        /// Title
        case title
        /// Subtitle
        case subtitle
        /// Image
        case image
    }
    
    /// Initializer with Decoder
    ///
    /// - Parameter decoder: The Decoder
    /// - Throws: If decoding fails
    public init(from decoder: Decoder) throws {
        // Initialize container keyed by CodingKeys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decode Title
        self.title = try container.decode(String.self, forKey: .title)
        // Decode Subtitle
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        // Check if Base64 Image String is available
        if let base64 = try container.decodeIfPresent(String.self, forKey: .image) {
            // Decode Base64 to Image
            self.image = Data(base64Encoded: base64, options: .ignoreUnknownCharacters).flatMap(UIImage.init)
        } else {
            // No image base64 representation available
            self.image = nil
        }
    }
    
    /// Encode
    ///
    /// - Parameter encoder: The Encoder
    /// - Throws: If encoding fails
    public func encode(to encoder: Encoder) throws {
        // Initialize Container keyed by CodingKeys
        var container = encoder.container(keyedBy: CodingKeys.self)
        // Encode Title
        try container.encode(self.title, forKey: .title)
        // Encode Subtitle
        try container.encode(self.subtitle, forKey: .subtitle)
        // Try to Encode Image as Base64 string
        if let image = self.image, let data = image.pngData() {
            let base64 = data.base64EncodedString(options: .lineLength64Characters)
            try container.encode(base64, forKey: .image)
        }
    }
    
}
