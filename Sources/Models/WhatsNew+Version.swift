//
//  WhatsNew+Version.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 22.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation

// MARK: - Version

public extension WhatsNew {
    
    /// The Version
    struct Version: Codable, Equatable {
        
        /// The major version
        public let major: Int
        
        /// The minor version
        public let minor: Int
        
        /// The patch version
        public let patch: Int
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - major: The major version
        ///   - minor: The minor version
        ///   - patch: The patch version
        public init(major: Int,
                    minor: Int,
                    patch: Int) {
            self.major = major
            self.minor = minor
            self.patch = patch
        }
        
    }
    
}

// MARK: - CustomStringConvertible

extension WhatsNew.Version: CustomStringConvertible {
    
    public var description: String {
        return "\(self.major).\(self.minor).\(self.patch)"
    }
    
}

// MARK: - ExpressibleByStringLiteral

extension WhatsNew.Version: ExpressibleByStringLiteral {
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: String) {
        let values = value.components(separatedBy: ".").compactMap(Int.init)
        self.major = values.indices.contains(0) ? values[0] : 0
        self.minor = values.indices.contains(1) ? values[1] : 0
        self.patch = values.indices.contains(2) ? values[2] : 0
    }
    
}
