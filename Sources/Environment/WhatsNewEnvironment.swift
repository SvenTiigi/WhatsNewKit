import Foundation

// MARK: - WhatsNewEnvironment

/// A WhatsNew Environment
open class WhatsNewEnvironment {
    
    // MARK: Properties
    
    /// The current WhatsNew Version
    public let currentVersion: WhatsNew.Version
    
    /// The WhatsNewVersionStore
    public let whatsNewVersionStore: WhatsNewVersionStore
    
    /// The default WhatsNew Layout
    public let defaultLayout: WhatsNew.Layout
    
    /// The WhatsNewCollection
    public let whatsNewCollection: WhatsNewCollection
    
    // MARK: Initializer
    
    /// Creates a new instance of `WhatsNewEnvironment`
    /// - Parameters:
    ///   - currentVersion: The current WhatsNew Version. Default value `.current()`
    ///   - versionStore: The WhatsNewVersionStore. Default value `UserDefaultsWhatsNewVersionStore()`
    ///   - defaultLayout: The default WhatsNew Layout. Default value `.default`
    ///   - whatsNew: The WhatsNewCollection
    public init(
        currentVersion: WhatsNew.Version = .current(),
        versionStore: WhatsNewVersionStore = UserDefaultsWhatsNewVersionStore(),
        defaultLayout: WhatsNew.Layout = .default,
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
    ///   - defaultLayout: The default WhatsNew Layout. Default value `.default`
    ///   - whatsNew: The WhatsNewCollectionProvider
    public convenience init(
        currentVersion: WhatsNew.Version = .current(),
        versionStore: WhatsNewVersionStore = UserDefaultsWhatsNewVersionStore(),
        defaultLayout: WhatsNew.Layout = .default,
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
    ///   - defaultLayout: The default WhatsNew Layout. Default value `.default`
    ///   - whatsNew: A result builder closure that produces a WhatsNewCollection
    public convenience init(
        currentVersion: WhatsNew.Version = .current(),
        versionStore: WhatsNewVersionStore = UserDefaultsWhatsNewVersionStore(),
        defaultLayout: WhatsNew.Layout = .default,
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
    
    // MARK: WhatsNew
    
    /// Retrieve a WhatsNew that should be presented to the user, if available.
    open func whatsNew() -> WhatsNew? {
        // Retrieve presented WhatsNew Versions from WhatsNewVersionStore
        let presentedWhatsNewVersions = self.whatsNewVersionStore.presentedVersions
        // Verify the current Version has not been presented
        guard !presentedWhatsNewVersions.contains(self.currentVersion) else {
            // Otherwise WhatsNew has already been presented for the current version
            return nil
        }
        // Check if a WhatsNew is available for the current Version
        if let whatsNew = self.whatsNewCollection.first(where: { $0.version == self.currentVersion }) {
            // Return WhatsNew for the current Version
            return whatsNew
        }
        // Otherwise initialize current minor release Version
        let currentMinorVersion = WhatsNew.Version(
            major: self.currentVersion.major,
            minor: self.currentVersion.minor,
            patch: 0
        )
        // Verify the current minor release Version has not been presented
        guard !presentedWhatsNewVersions.contains(currentMinorVersion) else {
            // Otherwise WhatsNew for current minor release Version has already been preseted
            return nil
        }
        // Return WhatsNew for current minor release Version, if available
        return self.whatsNewCollection.first { $0.version == currentMinorVersion }
    }
    
}
