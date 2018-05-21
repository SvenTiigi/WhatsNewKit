//
//  WhatsNewStore.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 21.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation

/// The WhatsNewStore
struct WhatsNewStore {
    
    /// The WhatsNewKit PrefixIdentifier
    private let prefixIdentifier = "de.tiigi.whatsnewkit."
    
    /// Set Version
    ///
    /// - Parameter version: The Version
    func set(version: String) {
        // Set Version
        UserDefaults.standard.set(version, forKey: prefixIdentifier + version)
        // Synchronize UserDefaults
        UserDefaults.standard.synchronize()
    }
    
    /// Has Version
    ///
    /// - Parameter version: The Version
    /// - Returns: Bool if Version has been presented
    func has(version: String) -> Bool {
        return UserDefaults.standard.object(forKey: prefixIdentifier + version) != nil
    }
    
    /// Clear all stored Versions
    func clear() {
        let values = UserDefaults.standard.dictionaryRepresentation()
        values.filter {
            $0.key.starts(with: self.prefixIdentifier)
        }.map {
            $0.key
        }.forEach(UserDefaults.standard.removeObject)
    }
    
}
