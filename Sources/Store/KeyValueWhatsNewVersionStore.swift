import Foundation

// MARK: - KeyValueable

/// The KeyValueable Protocol
public protocol KeyValueable {
    
    /// Set value for key
    /// - Parameters:
    ///   - value: The value
    ///   - key: The key
    func set(_ value: Any?, forKey key: String)
    
    /// Retrieve object for key
    /// - Parameter forKey: The key
    /// - Returns: The corresponding object
    func object(forKey: String) -> Any?
    
}

// MARK: - UserDefaults+KeyValueable

extension UserDefaults: KeyValueable {}

// MARK: - NSUbiquitousKeyValueStore+KeyValueable

extension NSUbiquitousKeyValueStore: KeyValueable {}

// MARK: - KeyValueWhatsNewVersionStore

/// The KeyValueWhatsNewVersionStore
public struct KeyValueWhatsNewVersionStore {
    
    // MARK: Static-Properties
    
    /// The default prefix identifier
    public static let defaultPrefixIdentifier = "de.tiigi.whatsnewkit"
    
    // MARK: Properties
    
    /// The KeyValueable
    private let keyValueable: KeyValueable
    
    /// The prefix identifier
    private let prefixIdentifier: String
    
    // MARK: Initializer
    
    /// Creates a new instance of `KeyValueWhatsNewVersionStore`
    /// - Parameters:
    ///   - keyValueable: The KeyValueable Object. Default value `UserDefaults.standard`
    ///   - prefixIdentifier: The prefix identifier. Default value `Self.defaultPrefixIdentifier`
    public init(
        keyValueable: KeyValueable = UserDefaults.standard,
        prefixIdentifier: String = Self.defaultPrefixIdentifier
    ) {
        self.keyValueable = keyValueable
        self.prefixIdentifier = prefixIdentifier
    }
    
}

// MARK: - Key for Version

private extension KeyValueWhatsNewVersionStore {
    
    /// Retrieve Key for Version
    /// - Parameter version: The Version
    /// - Returns: String key concatenated with prefix identifier
    func key(
        forVersion version: WhatsNew.Version
    ) -> String {
        [
            self.prefixIdentifier.isEmpty ? nil : self.prefixIdentifier,
            version.description
        ]
        .compactMap { $0 }
        .joined(separator: ".")
    }
    
}

// MARK: - WriteableWhatsNewVersionStore

extension KeyValueWhatsNewVersionStore: WriteableWhatsNewVersionStore {
    
    /// Set Version
    /// - Parameter version: The Version
    public func set(
        version: WhatsNew.Version
    ) {
        self.keyValueable.set(
            version.description,
            forKey: self.key(forVersion: version)
        )
    }
    
}

// MARK: - ReadableWhatsNewVersionStore

extension KeyValueWhatsNewVersionStore: ReadableWhatsNewVersionStore {
    
    /// Has Version
    /// - Parameter version: The Version
    /// - Returns: Bool if Version has been presented
    public func has(
        version: WhatsNew.Version
    ) -> Bool {
        // Retrieve object for key as String
        let versionObjectString = self.keyValueable.object(forKey: self.key(forVersion: version)) as? String
        // Return string comparison result
        return versionObjectString == version.description
    }
    
}
