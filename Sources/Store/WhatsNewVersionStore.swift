import Foundation

// MARK: - WhatsNewVersionStore

/// A WhatsNewVersionStore
public typealias WhatsNewVersionStore = WriteableWhatsNewVersionStore & ReadableWhatsNewVersionStore

// MARK: - WriteableWhatsNewVersionStore

/// A Writeable WhatsNewVersionStore
public protocol WriteableWhatsNewVersionStore {
    
    /// Save presented WhatsNew Version
    /// - Parameter version: The presented WhatsNew Version that should be saved
    func save(
        presentedVersion version: WhatsNew.Version
    )
    
}

// MARK: - ReadableWhatsNewVersionStore

/// A Readable WhatsNewVersionStore
public protocol ReadableWhatsNewVersionStore {
    
    /// Retrieve a bool value if a given WhatsNew Version has been presented
    /// - Parameter version: The WhatsNew Version to check
    /// - Returns: Bool if WhatsNew Version has been presented
    func hasPresented(
        version: WhatsNew.Version
    ) -> Bool
    
}
