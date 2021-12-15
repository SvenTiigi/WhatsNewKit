import Foundation

/// The CloudKitWhatsNewVersionStore typealias representing a NSUbiquitousKeyValueWhatsNewVersionStore
public typealias CloudKitWhatsNewVersionStore = NSUbiquitousKeyValueWhatsNewVersionStore

// MARK: - NSUbiquitousKeyValueWhatsNewVersionStore

/// A NSUbiquitousKeyValue WhatsNewVersionStore
public struct NSUbiquitousKeyValueWhatsNewVersionStore {
    
    // MARK: Properties
    
    /// The NSUbiquitousKeyValueStore
    private let ubiquitousKeyValueStore: NSUbiquitousKeyValueStore
    
    /// The optional Key prefix
    private let keyPrefix: String?
    
    // MARK: Initializer
    
    /// Creates a new instance of `NSUbiquitousKeyValueWhatsNewVersionStore`
    /// - Parameters:
    ///   - ubiquitousKeyValueStore: The NSUbiquitousKeyValueWhatsNewVersionStore. Default value `.default`
    ///   - keyPrefix: The optional Key prefix. Default value `Bundle.main.bundleIdentifier`
    public init(
        ubiquitousKeyValueStore: NSUbiquitousKeyValueStore = .default,
        keyPrefix: String? = Bundle.main.bundleIdentifier
    ) {
        self.ubiquitousKeyValueStore = ubiquitousKeyValueStore
        self.keyPrefix = keyPrefix
    }
    
}

// MARK: - WriteableWhatsNewVersionStore

extension NSUbiquitousKeyValueWhatsNewVersionStore: WriteableWhatsNewVersionStore {
    
    /// Save presented WhatsNew Version
    /// - Parameter version: The presented WhatsNew Version that should be saved
    public func save(
        presentedVersion version: WhatsNew.Version
    ) {
        self.ubiquitousKeyValueStore.set(
            version.description,
            forKey: version.key(prefix: self.keyPrefix)
        )
    }
    
}

// MARK: - ReadableWhatsNewVersionStore

extension NSUbiquitousKeyValueWhatsNewVersionStore: ReadableWhatsNewVersionStore {
    
    /// Retrieve a bool value if a given WhatsNew Version has been presented
    /// - Parameter version: The WhatsNew Version to check
    /// - Returns: Bool if WhatsNew Version has been presented
    public func hasPresented(
        version: WhatsNew.Version
    ) -> Bool {
        self.ubiquitousKeyValueStore.string(forKey: version.key(prefix: self.keyPrefix)) == version.description
    }
    
}
