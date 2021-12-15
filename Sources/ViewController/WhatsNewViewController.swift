import SwiftUI

// MARK: - WhatsNewViewController

/// The WhatsNewViewController
public final class WhatsNewViewController: UIHostingController<WhatsNewView> {
    
    // MARK: Properties
    
    /// The WhatsNew object
    private let whatsNew: WhatsNew
    
    /// The optional WhatsNewVersionStore
    private let whatsNewVersionStore: WhatsNewVersionStore?
    
    // MARK: Initializer
    
    /// Creates a new instance of `WhatsNewViewController`
    /// - Parameter whatsNew: The WhatsNew object
    public init(
        whatsNew: WhatsNew
    ) {
        self.whatsNew = whatsNew
        self.whatsNewVersionStore = nil
        super.init(
            rootView: .init(
                whatsNew: whatsNew
            )
        )
    }
    
    /// Creates a new instance of `WhatsNewViewController`
    /// by using the provided `WhatsNewVersionStore` to verify that the
    /// version of the WhatsNew object has not already been presented to the user.
    /// If the version is contained in the provided `WhatsNewVersionStore` the initializer
    /// will return `nil`
    /// - Parameters:
    ///   - whatsNew: The WhatsNew object
    ///   - versionStore: The WhatsNewVersionStore
    public init?(
        whatsNew: WhatsNew,
        versionStore: WhatsNewVersionStore
    ) {
        // Verify WhatsNew Version is not contained in the provided WhatsNewVersionStore
        guard !versionStore.has(version: whatsNew.version) else {
            // Otherwise return nil
            return nil
        }
        self.whatsNew = whatsNew
        self.whatsNewVersionStore = versionStore
        super.init(
            rootView: .init(
                whatsNew: whatsNew
            )
        )
    }
    
    /// Initializer with NSCoder is unavailable, please use `init(whatsNew:)`
    @available(*, unavailable)
    public required init?(
        coder aDecoder: NSCoder
    ) { nil }
    
    /// Deinit
    deinit {
        // Set WhatsNew Version on WhatsNewVersionStore, if available
        self.whatsNewVersionStore?.set(version: self.whatsNew.version)
    }
    
}
