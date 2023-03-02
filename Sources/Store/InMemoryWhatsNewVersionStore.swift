import Foundation

// MARK: - InMemoryWhatsNewVersionStore

/// The InMemoryWhatsNewVersionStore
public final class InMemoryWhatsNewVersionStore {
    
    // MARK: Static-Properties
    
    /// The shared `InMemoryWhatsNewVersionStore` instance
    public static let shared = InMemoryWhatsNewVersionStore()
    
    // MARK: Properties
    
    /// The Versions
    public var versions: Set<WhatsNew.Version>
    
    // MARK: Initializer
    
    /// Creates a new instance of `InMemoryWhatsNewVersionStore`
    public init() {
        self.versions = .init()
    }
    
}

// MARK: - WriteableWhatsNewVersionStore

extension InMemoryWhatsNewVersionStore: WriteableWhatsNewVersionStore {
    
    /// Save presented WhatsNew Version
    /// - Parameter version: The presented WhatsNew Version that should be saved
    public func save(
        presentedVersion version: WhatsNew.Version
    ) {
        self.versions.insert(version)
    }
    
}

// MARK: - ReadableWhatsNewVersionStore

extension InMemoryWhatsNewVersionStore: ReadableWhatsNewVersionStore {
    
    /// The WhatsNew Versions that have been already been presented
    public var presentedVersions: [WhatsNew.Version] {
        .init(self.versions)
    }
    
}

// MARK: - Remove

public extension InMemoryWhatsNewVersionStore {
    
    /// Remove presented WhatsNew Version
    /// - Parameter version: The presented WhatsNew Version that should be removed
    func remove(
        presentedVersion version: WhatsNew.Version
    ) {
        self.versions.remove(version)
    }
    
}

// MARK: - Remove all

public extension InMemoryWhatsNewVersionStore {
    
    /// Remove all presented WhatsNew Versions
    func removeAll() {
        self.versions.removeAll()
    }
    
}
