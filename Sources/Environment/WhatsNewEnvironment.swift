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
    ///   - whatsNewCollection: The WhatsNewCollection
    public init(
        currentVersion: WhatsNew.Version = .current(),
        versionStore: WhatsNewVersionStore = UserDefaultsWhatsNewVersionStore(),
        defaultLayout: WhatsNew.Layout = .default,
        whatsNewCollection: WhatsNewCollection = .init()
    ) {
        self.currentVersion = currentVersion
        self.whatsNewVersionStore = versionStore
        self.defaultLayout = defaultLayout
        self.whatsNewCollection = whatsNewCollection
    }
    
    /// Creates a new instance of `WhatsNewEnvironment`
    /// - Parameters:
    ///   - currentVersion: The current WhatsNew Version. Default value `.current()`
    ///   - versionStore: The WhatsNewVersionStore. Default value `UserDefaultsWhatsNewVersionStore()`
    ///   - defaultLayout: The default WhatsNew Layout. Default value `.default`
    ///   - whatsNewCollection: The WhatsNewCollectionProvider
    public convenience init(
        currentVersion: WhatsNew.Version = .current(),
        versionStore: WhatsNewVersionStore = UserDefaultsWhatsNewVersionStore(),
        defaultLayout: WhatsNew.Layout = .default,
        whatsNewCollection whatsNewCollectionProvider: WhatsNewCollectionProvider
    ) {
        self.init(
            currentVersion: currentVersion,
            versionStore: versionStore,
            defaultLayout: defaultLayout,
            whatsNewCollection: whatsNewCollectionProvider.whatsNewCollection
        )
    }
    
    /// Creates a new instance of `WhatsNewEnvironment`
    /// - Parameters:
    ///   - currentVersion: The current WhatsNew Version. Default value `.current()`
    ///   - versionStore: The WhatsNewVersionStore. Default value `UserDefaultsWhatsNewVersionStore()`
    ///   - defaultLayout: The default WhatsNew Layout. Default value `.default`
    ///   - whatsNewCollection: A result builder closure that produces a WhatsNewCollection
    public convenience init(
        currentVersion: WhatsNew.Version = .current(),
        versionStore: WhatsNewVersionStore = UserDefaultsWhatsNewVersionStore(),
        defaultLayout: WhatsNew.Layout = .default,
        @WhatsNewCollectionBuilder
        whatsNewCollection: () -> WhatsNewCollection
    ) {
        self.init(
            currentVersion: currentVersion,
            versionStore: versionStore,
            defaultLayout: defaultLayout,
            whatsNewCollection: whatsNewCollection()
        )
    }
    
    // MARK: WhatsNew
    
    /// Retrieve a WhatsNew that should be presented to the user, if available.
    open func whatsNew() -> WhatsNew? {
        // Retrieve presented WhatsNew Versions from WhatsNewVersionStore
        let presentedWhatsNewVersions = self.whatsNewVersionStore.presentedVersions
        
        let availableWhatsNewViews = self.whatsNewCollection
            .sorted(by: { $0.version > $1.version })
            .filter({ $0.version <= self.currentVersion })

        if let latestWhatsNew = availableWhatsNewViews.first,
           !presentedWhatsNewVersions.contains(latestWhatsNew.version) {
            return latestWhatsNew
        }
        
        return nil
    }
}
