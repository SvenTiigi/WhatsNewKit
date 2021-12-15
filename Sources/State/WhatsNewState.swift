import SwiftUI

// MARK: - WhatsNewState

/// A WhatsNew State property wrapper
@propertyWrapper
public struct WhatsNewState: DynamicProperty {
    
    // MARK: Properties
    
    /// The WhatsNew object
    @State
    public var whatsNew: WhatsNew?
    
    /// The WhatsNewVersionStore
    public let whatsNewVersionStore: WhatsNewVersionStore
    
    /// The wrapped WhatsNew value
    public var wrappedValue: WhatsNew? {
        get {
            // Verify WhatsNew is available and the version
            // is not available in the WhatsNewVersionStore
            guard let whatsNew = self.whatsNew,
                  !self.whatsNewVersionStore.has(version: whatsNew.version) else {
                // Otherwise return nil
                return nil
            }
            // Return WhatsNew
            return whatsNew
        }
        set {
            // Set new value
            self.whatsNew = newValue
        }
    }
    
    /// The WhatsNewState projected value
    public var projectedValue: Self {
        self
    }
    
    /// The WhatsNew Binding value
    public var binding: Binding<WhatsNew?> {
        .init(
            get: {
                self.wrappedValue
            },
            set: {
                self.whatsNew = $0
            }
        )
    }
    
    // MARK: Initializer
    
    /// Creates a new instance of `WhatsNewState`
    /// - Parameters:
    ///   - wrappedValue: The wrapped WhatsNew value
    ///   - versionStore: The VersionStore. Default value `.userDefaults()`
    public init(
        wrappedValue: WhatsNew?,
        versionStore: VersionStore = .userDefaults()
    ) {
        self._whatsNew = .init(initialValue: wrappedValue)
        self.whatsNewVersionStore = versionStore()
    }
    
}
