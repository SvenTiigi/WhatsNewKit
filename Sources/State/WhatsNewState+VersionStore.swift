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
            prefixIdentifier: String = KeyValueWhatsNewVersionStore.defaultPrefixIdentifier
        )
        /// iCloud
        case iCloud(
            ubiquitousKeyValueStore: NSUbiquitousKeyValueStore = .default,
            prefixIdentifier: String = KeyValueWhatsNewVersionStore.defaultPrefixIdentifier
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
        case .userDefaults(let userDefaults, let prefixIdentifier):
            return KeyValueWhatsNewVersionStore(
                keyValueable: userDefaults,
                prefixIdentifier: prefixIdentifier
            )
        case .iCloud(let ubiquitousKeyValueStore, let prefixIdentifier):
            return KeyValueWhatsNewVersionStore(
                keyValueable: ubiquitousKeyValueStore,
                prefixIdentifier: prefixIdentifier
            )
        case .custom(let versionStore):
            return versionStore
        }
    }
    
}
