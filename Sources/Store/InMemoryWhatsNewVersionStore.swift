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

// MARK: - Clear

public extension InMemoryWhatsNewVersionStore {
    
    /// Clear all stored Versions
    func clear() {
        self.versions.removeAll()
    }
    
}

// MARK: - WriteableWhatsNewVersionStore

extension InMemoryWhatsNewVersionStore: WriteableWhatsNewVersionStore {
    
    /// Set Version
    /// - Parameter version: The Version
    public func set(
        version: WhatsNew.Version
    ) {
        self.versions.append(version)
    }
    
}

// MARK: - ReadableWhatsNewVersionStore

extension InMemoryWhatsNewVersionStore: ReadableWhatsNewVersionStore {
    
    /// Has Version
    /// - Parameter version: The Version
    /// - Returns: Bool if Version has been presented
    public func has(
        version: WhatsNew.Version
    ) -> Bool {
        self.versions.contains(version)
    }
    
}
