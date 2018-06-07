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

// MARK: - Comparable

extension WhatsNew.Version: Comparable {
    
    /// Returns a Boolean value indicating whether the value of the first
    public static func < (lhs: WhatsNew.Version, rhs: WhatsNew.Version) -> Bool {
        let sum: (WhatsNew.Version) -> Int = { $0.major * 100 + $0.minor * 10 + $0.patch }
        return sum(lhs) < sum(rhs)
    }
    
}

// MARK: - CustomStringConvertible

extension WhatsNew.Version: CustomStringConvertible {
    
    /// A textual representation of this instance.
    public var description: String {
        return "\(self.major).\(self.minor).\(self.patch)"
    }
    
}

// MARK: - ExpressibleByStringLiteral

extension WhatsNew.Version: ExpressibleByStringLiteral {
    
    /// A type that represents a string literal.
    ///
    /// Valid types for `StringLiteralType` are `String` and `StaticString`.
    public typealias StringLiteralType = String
    
    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral value: String) {
        let values = value.components(separatedBy: ".").compactMap(Int.init)
        self.major = values.indices.contains(0) ? values[0] : 0
        self.minor = values.indices.contains(1) ? values[1] : 0
        self.patch = values.indices.contains(2) ? values[2] : 0
    }
    
}

// MARK: - Current

public extension WhatsNew.Version {
    
    /// Retrieve WhatsNew.Version based on current Version String in Bundle
    ///
    /// - Parameter bundle: The Bundle
    /// - Returns: WhatsNew.Version
    static func current(inBundle bundle: Bundle = .main) -> WhatsNew.Version {
        // Retrieve Bundle short Version String
        let shortVersionString = bundle.infoDictionary?["CFBundleShortVersionString"] as? String
        // Return initialized Version via String Literal
        return .init(stringLiteral:
            shortVersionString ?? ""
        )
    }
    
}
