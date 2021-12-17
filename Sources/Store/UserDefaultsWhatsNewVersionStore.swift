import Foundation

// MARK: - UserDefaultsWhatsNewVersionStore

/// A UserDefaults WhatsNewVersionStore
public struct UserDefaultsWhatsNewVersionStore {
    
    // MARK: Properties
    
    /// The UserDefaults
    private let userDefaults: UserDefaults
    
    // MARK: Initializer
    
    /// Creates a new instance of `UserDefaultsWhatsNewVersionStore`
    /// - Parameters:
    ///   - userDefaults: The UserDefaults. Default value `.standard`
    public init(
        userDefaults: UserDefaults = .standard
    ) {
        self.userDefaults = userDefaults
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
            forKey: version.key
        )
    }
    
}

// MARK: - ReadableWhatsNewVersionStore

extension UserDefaultsWhatsNewVersionStore: ReadableWhatsNewVersionStore {
    
    /// The WhatsNew Versions that have been already been presented
    public var presentedVersions: [WhatsNew.Version] {
        self.userDefaults
            .dictionaryRepresentation()
            .filter { $0.key.starts(with: WhatsNew.Version.keyPrefix) }
            .compactMap { $0.value as? String }
            .map(WhatsNew.Version.init)
    }
    
}
