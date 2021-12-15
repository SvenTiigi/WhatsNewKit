import Foundation

// MARK: - InMemoryWhatsNewVersionStore

/// The InMemoryWhatsNewVersionStore
public final class InMemoryWhatsNewVersionStore {
    
    // MARK: Properties
    
    /// The Versions
    public var versions: [WhatsNew.Version]
    
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
        self.versions.append(version)
    }
    
}

// MARK: - ReadableWhatsNewVersionStore

extension InMemoryWhatsNewVersionStore: ReadableWhatsNewVersionStore {
    
    /// Retrieve a bool value if a given WhatsNew Version has been presented
    /// - Parameter version: The WhatsNew Version to check
    /// - Returns: Bool if WhatsNew Version has been presented
    public func hasPresented(
        version: WhatsNew.Version
    ) -> Bool {
        self.versions.contains(version)
    }
    
}

// MARK: - Remove all

public extension InMemoryWhatsNewVersionStore {
    
    /// Remove all presented WhatsNew Versions
    func removeAll() {
        self.versions.removeAll()
    }
    
}
