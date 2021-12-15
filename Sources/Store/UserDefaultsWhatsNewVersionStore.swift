import Foundation

// MARK: - UserDefaultsWhatsNewVersionStore

/// A UserDefaults WhatsNewVersionStore
public struct UserDefaultsWhatsNewVersionStore {
    
    // MARK: Properties
    
    /// The UserDefaults
    private let userDefaults: UserDefaults
    
    /// The optional Key prefix
    private let keyPrefix: String?
    
    // MARK: Initializer
    
    /// Creates a new instance of `UserDefaultsWhatsNewVersionStore`
    /// - Parameters:
    ///   - userDefaults: The UserDefaults. Default value `.standard`
    ///   - keyPrefix: The optional Key prefix. Default value `Bundle.main.bundleIdentifier`
    public init(
        userDefaults: UserDefaults = .standard,
        keyPrefix: String? = Bundle.main.bundleIdentifier
    ) {
        self.userDefaults = userDefaults
        self.keyPrefix = keyPrefix
    }
    
}

// MARK: - WriteableWhatsNewVersionStore

extension UserDefaultsWhatsNewVersionStore: WriteableWhatsNewVersionStore {
    
    /// Save presented WhatsNew Version
    /// - Parameter version: The presented WhatsNew Version that should be saved
    public func save(
        presentedVersion version: WhatsNew.Version
    ) {
        self.userDefaults.set(
            version.description,
            forKey: version.key(prefix: self.keyPrefix)
        )
    }
    
}

// MARK: - ReadableWhatsNewVersionStore

extension UserDefaultsWhatsNewVersionStore: ReadableWhatsNewVersionStore {
    
    /// Retrieve a bool value if a given WhatsNew Version has been presented
    /// - Parameter version: The WhatsNew Version to check
    /// - Returns: Bool if WhatsNew Version has been presented
    public func hasPresented(
        version: WhatsNew.Version
    ) -> Bool {
        self.userDefaults.string(forKey: version.key(prefix: self.keyPrefix)) == version.description
    }
    
}
