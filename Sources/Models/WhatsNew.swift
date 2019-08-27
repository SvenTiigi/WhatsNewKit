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
public struct WhatsNew: Codable, Equatable, Hashable {
    
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
