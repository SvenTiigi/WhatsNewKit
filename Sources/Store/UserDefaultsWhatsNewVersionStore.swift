//
//  UserDefaultsWhatsNewVersionStore.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 22.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation

// MARK: - UserDefaultsWhatsNewVersionStore

/// The UserDefaultsWhatsNewVersionStore
public struct UserDefaultsWhatsNewVersionStore: Equatable {
    
    // MARK: Properties
    
    /// The UserDefaults
    private let userDefaults: UserDefaults
    
    /// The PrefixIdentifier
    private let prefixIdentifier: String
    
    // MARK: Initializer

    /// Default initializer
    ///
    /// - Parameters:
    ///   - userDefaults: The UserDefaults. Default value `.standard`
    ///   - prefixIdentifier: The prefix identifier. Default value `de.tiigi.whatsnewkit.`
    public init(userDefaults: UserDefaults = .standard,
                prefixIdentifier: String = "de.tiigi.whatsnewkit.") {
        self.userDefaults = userDefaults
        self.prefixIdentifier = prefixIdentifier
    }
    
}

// MARK: - WhatsNewVersionStore

extension UserDefaultsWhatsNewVersionStore: WhatsNewVersionStore {
    
    /// Set Version
    ///
    /// - Parameter version: The Version
    public func set(version: WhatsNew.Version) {
        // Set Version
        self.userDefaults.set(version, forKey: prefixIdentifier + version.description)
        // Synchronize UserDefaults
        self.userDefaults.synchronize()
    }
    
    /// Has Version
    ///
    /// - Parameter version: The Version
    /// - Returns: Bool if Version has been presented
    public func has(version: WhatsNew.Version) -> Bool {
        return self.userDefaults.object(forKey: prefixIdentifier + version.description) != nil
    }
    
    /// Clear all stored Versions
    public func clearVersions() {
        // Retrieve dictionary representation
        let values = self.userDefaults.dictionaryRepresentation()
        // Remove all UserDefaults stored Versions
        values.filter {
            // Filter where key starts with prefix identifier
            $0.key.starts(with: self.prefixIdentifier)
        }.map {
            // Map to Key
            $0.key
        }.forEach(UserDefaults.standard.removeObject)
    }
    
}
