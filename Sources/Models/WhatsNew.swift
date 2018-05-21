//
//  WhatsNew.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation

/// WhatsNew
public struct WhatsNew: Codable, Equatable {
    
    // MARK: Properties
    
    /// The Version
    public let version: String
    
    /// The title
    public let title: Title
    
    /// The items
    public let items: [Item]
    
    /// The Detail
    public let detail: Detail?
    
    /// The Button
    public let button: Button
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - version: The Version
    ///   - title: The Title
    ///   - items: The Items
    ///   - detail: The optional Detail
    ///   - button: The Button
    public init(version: String,
                title: Title,
                items: Item...,
                detail: Detail? = nil,
                button: Button) {
        self.version = version
        self.title = title
        self.items = items
        self.detail = detail
        self.button = button
    }
    
}
