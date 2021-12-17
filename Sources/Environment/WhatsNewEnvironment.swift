import Foundation

// MARK: - WhatsNewEnvironment

/// A WhatsNew Environment
open class WhatsNewEnvironment {
    
    // MARK: Properties
    
    /// The current WhatsNew Version
    public let currentVersion: WhatsNew.Version
    
    /// The WhatsNewVersionStore
    public let whatsNewVersionStore: WhatsNewVersionStore
    
    /// The default WhatsNewView Layout
    public let defaultLayout: WhatsNewView.Layout
    
    /// The WhatsNewCollection
    public let whatsNewCollection: WhatsNewCollection
    
    // MARK: Initializer
    
    /// Creates a new instance of `WhatsNewEnvironment`
    /// - Parameters:
    ///   - currentVersion: The current WhatsNew Version. Default value `.current()`
    ///   - versionStore: The WhatsNewVersionStore. Default value `UserDefaultsWhatsNewVersionStore()`
    ///   - defaultLayout: The default WhatsNewView Layout. Default value `.default`
    ///   - whatsNew: The WhatsNewCollection
    public init(
        currentVersion: WhatsNew.Version = .current(),
        versionStore: WhatsNewVersionStore = UserDefaultsWhatsNewVersionStore(),
        defaultLayout: WhatsNewView.Layout = .default,
        whatsNew: WhatsNewCollection = .init()
    ) {
        self.currentVersion = currentVersion
        self.whatsNewVersionStore = versionStore
        self.defaultLayout = defaultLayout
        self.whatsNewCollection = whatsNew
    }
    
    /// Creates a new instance of `WhatsNewEnvironment`
    /// - Parameters:
    ///   - currentVersion: The current WhatsNew Version. Default value `.current()`
    ///   - versionStore: The WhatsNewVersionStore. Default value `UserDefaultsWhatsNewVersionStore()`
    ///   - defaultLayout: The default WhatsNewView Layout. Default value `.default`
    ///   - whatsNew: The WhatsNewCollectionProvider
    public convenience init(
        currentVersion: WhatsNew.Version = .current(),
        versionStore: WhatsNewVersionStore = UserDefaultsWhatsNewVersionStore(),
        defaultLayout: WhatsNewView.Layout = .default,
        whatsNew: WhatsNewCollectionProvider
    ) {
        self.init(
            currentVersion: currentVersion,
            versionStore: versionStore,
            defaultLayout: defaultLayout,
            whatsNew: whatsNew.whatsNewCollection
        )
    }
    
    /// Creates a new instance of `WhatsNewEnvironment`
    /// - Parameters:
    ///   - currentVersion: The current WhatsNew Version. Default value `.current()`
    ///   - versionStore: The WhatsNewVersionStore. Default value `UserDefaultsWhatsNewVersionStore()`
    ///   - defaultLayout: The default WhatsNewView Layout. Default value `.default`
    ///   - whatsNew: A result builder closure that produces a WhatsNewCollection
    public convenience init(
        currentVersion: WhatsNew.Version = .current(),
        versionStore: WhatsNewVersionStore = UserDefaultsWhatsNewVersionStore(),
        defaultLayout: WhatsNewView.Layout = .default,
        @WhatsNewCollectionBuilder
        whatsNew: () -> WhatsNewCollection
    ) {
        self.init(
            currentVersion: currentVersion,
            versionStore: versionStore,
            defaultLayout: defaultLayout,
            whatsNew: whatsNew()
        )
    }
    
    // MARK: Get presentable WhatsNew
    
    /// Call WhatsNewEnvironment as function to retrieve a WhatsNew object
    /// that should be presented to the user, if available
    /// - Returns: An optional WhatsNew object
    open func getPresentableWhatsNew() -> WhatsNew? {
        // Retrieve presented WhatsNew Versions from WhatsNewVersionStore
        let presentedWhatsNewVersions = self.whatsNewVersionStore.presentedVersions
        // Check if the current Version has not been presented
        // and a WhatsNew is available for the current Version
        if !presentedWhatsNewVersions.contains(self.currentVersion),
            let whatsNew = self.whatsNewCollection[self.currentVersion] {
            // Return WhatsNew for the current Version
            return whatsNew
        }
        // Otherwise initialize current minor release Version
        let currentMinorVersion = WhatsNew.Version(
            major: self.currentVersion.major,
            minor: self.currentVersion.minor,
            patch: 0
        )
        // Check if current minor release Version has not been presented
        // and a WhatsNew is available for the current minor release Version
        if !presentedWhatsNewVersions.contains(currentMinorVersion),
            let whatsNew = self.whatsNewCollection[currentMinorVersion] {
            // Return WhatsNew for current minor release Version
            return whatsNew
        }
        // Otherwise return nil
        return nil
    }
    
}

// MARK: - Array<WhatsNew>+subscribt

private extension Array where Element == WhatsNew {
    
    /// Returns the first WhatsNew element of the sequence where the given WhatsNew Version matches
    /// - Parameters:
    ///   - version: The WhatsNew Version that must match
    subscript(
        _ version: WhatsNew.Version
    ) -> WhatsNew? {
        self.first { $0.version == version }
    }
    
}
