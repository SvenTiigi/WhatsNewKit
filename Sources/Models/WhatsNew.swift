//
//  WhatsNew.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - WhatsNew

/**
 The `WhatsNew` struct to declare your new app features.
 Read more on: [https://github.com/SvenTiigi/WhatsNewKit](https://github.com/SvenTiigi/WhatsNewKit)

 In default the `version` property will be initialized by reading out the current app version from the main bundle.

 # Example:
 ```
 import WhatsNewKit
 
 // WhatsNew for your current app version
 let whatsNew = WhatsNew(
     // The Title
     title: "WhatsNewKit",
     // The features you want to showcase
     items: [
         WhatsNew.Item(
             title: "Installation",
             subtitle: "You can install WhatsNewKit via CocoaPods or Carthage",
             image: UIImage(named: "installation")
         ),
         WhatsNew.Item(
             title: "Open Source",
             subtitle: "Contributions are very welcome 👨‍💻",
             image: UIImage(named: "openSource")
         )
     ]
 )
 
 // WhatsNew for a specific app version
 let whatsNew = WhatsNew(
     // The Title
     title: "WhatsNewKit",
     // The Version
     version: "1.0.1",
     // The features you want to showcase
     items: [...]
 )
 ```
 
 # Note:
 See  the `WhatsNewViewController` to present your new app features.
 */
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
    public init(
        version: Version = .current(inBundle: .main),
        title: String,
        items: [Item]
    ) {
        self.version = version
        self.title = title
        self.items = items
    }
    
}

// MARK: - Sequence<WhatsNew>+get

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
