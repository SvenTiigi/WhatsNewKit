//
//  KeyValueWhatsNewVersionStore.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 27.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation

// MARK: - KeyValueable

/// The KeyValueable Protocol
public protocol KeyValueable {
    
    /// Set value for key
    ///
    /// - Parameters:
    ///   - value: The value
    ///   - key: The key
    func set(_ value: Any?, forKey key: String)
    
    /// Retrieve object for key
    ///
    /// - Parameter forKey: The key
    /// - Returns: The corresponding object
    func object(forKey: String) -> Any?
    
}

// MARK: - KeyValueable UserDefaults

extension UserDefaults: KeyValueable {}

// MARK: - NSUbiquitousKeyValueStore UserDefaults

extension NSUbiquitousKeyValueStore: KeyValueable {}

// MARK: - KeyValueWhatsNewVersionStore

/// The KeyValueWhatsNewVersionStore
public struct KeyValueWhatsNewVersionStore {
    
    /// The KeyValueable
    private let keyValueable: KeyValueable
    
    /// The prefix identifier
    private let prefixIdentifier: String
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - keyValueable: The KeyValueable Object. Default value `UserDefaults.standard`
    ///   - prefixIdentifier: The prefix identifier. Default value `de.tiigi.whatsnewkit.`
    public init(keyValueable: KeyValueable = UserDefaults.standard,
                prefixIdentifier: String = "de.tiigi.whatsnewkit") {
        self.keyValueable = keyValueable
        self.prefixIdentifier = prefixIdentifier
    }
    
    // MARK: Private API
    
    /// Retrieve Key for Version
    ///
    /// - Parameter version: The Version
    /// - Returns: String key concatenated with prefix identifier
    private func key(forVersion version: WhatsNew.Version) -> String {
        return "\(self.prefixIdentifier)\(!self.prefixIdentifier.isEmpty ? "." : "")\(version)"
    }
    
}

// MARK: - WriteableWhatsNewVersionStore

extension KeyValueWhatsNewVersionStore: WriteableWhatsNewVersionStore {
    
    /// Set Version
    ///
    /// - Parameter version: The Version
    public func set(version: WhatsNew.Version) {
        // Set Version String representation
        self.keyValueable.set(
            version.description,
            forKey: self.key(forVersion: version)
        )
    }
    
}

// MARK: - ReadableWhatsNewVersionStore

extension KeyValueWhatsNewVersionStore: ReadableWhatsNewVersionStore {
    
    /// Has Version
    ///
    /// - Parameter version: The Version
    /// - Returns: Bool if Version has been presented
    public func has(version: WhatsNew.Version) -> Bool {
        // Retrieve object for key as String
        let versionObjectString = self.keyValueable.object(forKey: self.key(forVersion: version)) as? String
        // Return string comparison result
        return versionObjectString == version.description
    }
    
}
