//
//  WhatsNew.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - WhatsNew

/// WhatsNew
public struct WhatsNew: Codable, Equatable {
    
    // MARK: Properties
    
    /// The Version
    public let version: Version
    
    /// The title
    public let title: String
    
    /// The items
    public let items: [Item]
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - version: The Version. Default value `current`
    ///   - title: The Title
    ///   - items: The Items
    public init(version: Version = .current(inBundle: .main),
                title: String,
                items: [Item]) {
        self.version = version
        self.title = title
        self.items = items
    }
    
}

// MARK: - Sequence WhatsNew Extension

public extension Sequence where Element == WhatsNew {
    
    /// Retrieve WhatsNew element based on given Version
    ///
    /// - Parameter version: The Version
    /// - Returns: The first matching WhatsNew element
    func get(byVersion version: WhatsNew.Version) -> WhatsNew? {
        // First where Version is matching
        return self.first(where: {
            $0.version == version
        })
    }
    
    /// Retrieve WhatsNew element based on current Version of Bundle
    ///
    /// - Parameter bundle: The Bundle
    /// - Returns: The first matching WhatsNew element
    func get(byBundle bundle: Bundle = .main) -> WhatsNew? {
        // Initialize current Version based on bundle
        let currentVersion = WhatsNew.Version.current(inBundle: bundle)
        // Return WhatsView by version
        return self.get(
            byVersion: currentVersion
        )
    }
    
}
