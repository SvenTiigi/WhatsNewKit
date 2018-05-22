//
//  WhatsNewVersionStore.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 21.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation

/// The WhatsNewVersionStore
public protocol WhatsNewVersionStore {
    
    /// Set Version
    ///
    /// - Parameter version: The Version
    func set(version: WhatsNew.Version)
    
    /// Has Version
    ///
    /// - Parameter version: The Version
    /// - Returns: Bool if Version has been presented
    func has(version: WhatsNew.Version) -> Bool
    
    /// Clear all stored Versions
    func clearVersions()
    
}
