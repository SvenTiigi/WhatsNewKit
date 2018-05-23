//
//  WhatsNew.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// WhatsNew
public struct WhatsNew: Codable, Equatable {
    
    // MARK: Properties
    
    /// The Version
    public let version: Version
    
    /// The title
    public let title: String
    
    /// The items
    public let items: [Item]
    
    /// The detail button title
    public let detailButtonTitle: String?
    
    /// The completion button title
    public let completionButtonTitle: String
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - version: The Version
    ///   - title: The Title
    ///   - items: The Items
    ///   - detailButtonTitle: The optional detail button title
    ///   - completionButtonTitle: The completion button title
    public init(version: Version,
                title: String,
                items: Item...,
                detailButtonTitle: String? = nil,
                completionButtonTitle: String) {
        self.version = version
        self.title = title
        self.items = items
        self.detailButtonTitle = detailButtonTitle
        self.completionButtonTitle = completionButtonTitle
    }
    
}
