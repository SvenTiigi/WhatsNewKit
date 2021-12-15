import Foundation

// MARK: - WhatsNewState+VersionStore

public extension WhatsNewState {
    
    /// A WhatsNewState VersionStore
    enum VersionStore {
        /// InMemory
        case inMemory
        /// UserDefaults
        case userDefaults(
            userDefaults: UserDefaults = .standard,
            keyPrefix: String? = Bundle.main.bundleIdentifier
        )
        /// iCloud
        case iCloud(
            ubiquitousKeyValueStore: NSUbiquitousKeyValueStore = .default,
            keyPrefix: String? = Bundle.main.bundleIdentifier
        )
        /// Custom
        case custom(WhatsNewVersionStore)
    }
    
}

// MARK: - VersionStore+init(whatsNewVersionStore:)

public extension WhatsNewState.VersionStore {
    
    /// Creates a new instance of `WhatsNewState.VersionStore`
    /// - Parameter whatsNewVersionStore: The WhatsNewVersionStore
    init(
        _ whatsNewVersionStore: WhatsNewVersionStore
    ) {
        self = .custom(whatsNewVersionStore)
    }
    
}

// MARK: - VersionStore+callAsFunction

public extension WhatsNewState.VersionStore {
    
    /// Call WhatsNewState VersionStore as function
    /// - Returns: The WhatsNewVersionStore
    func callAsFunction() -> WhatsNewVersionStore {
        switch self {
        case .inMemory:
            return InMemoryWhatsNewVersionStore()
        case .userDefaults(let userDefaults, let keyPrefix):
            return UserDefaultsWhatsNewVersionStore(
                userDefaults: userDefaults,
                keyPrefix: keyPrefix
            )
        case .iCloud(let ubiquitousKeyValueStore, let keyPrefix):
            return NSUbiquitousKeyValueWhatsNewVersionStore(
                ubiquitousKeyValueStore: ubiquitousKeyValueStore,
                keyPrefix: keyPrefix
            )
        case .custom(let versionStore):
            return versionStore
        }
    }
    
}
