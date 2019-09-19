//
//  Sequence+WhatsNew.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 27.08.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import Foundation

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
