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
    
    /// The WhatsNew Versions that have been already been presented
    var presentedVersions: [WhatsNew.Version] { get }
    
}

// MARK: - ReadableWhatsNewVersionStore+hasPresented

public extension ReadableWhatsNewVersionStore {
    
    /// Retrieve a bool value if a given WhatsNew Version has already been presented
    /// - Parameter whatsNew: The WhatsNew Version to verify
    /// - Returns: A Bool value if the given WhatsNew Version has already been preseted
    func hasPresented(
        _ version: WhatsNew.Version
    ) -> Bool {
        self.presentedVersions.contains(version)
    }
    
    /// Retrieve a bool value if a given WhatsNew has already been presented
    /// - Parameter whatsNew: The WhatsNew to verify
    /// - Returns: A Bool value if the given WhatsNew has already been preseted
    func hasPresented(
        _ whatsNew: WhatsNew
    ) -> Bool {
        self.hasPresented(whatsNew.version)
    }
    
}
