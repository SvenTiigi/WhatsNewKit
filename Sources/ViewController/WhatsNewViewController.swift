import SwiftUI

// MARK: - WhatsNewViewController

/// A WhatsNew UIViewController
open class WhatsNewViewController: UIHostingController<WhatsNewView> {
    
    /// Creates a new instance of `WhatsNewViewController`
    /// - Parameters:
    ///   - whatsNew: The WhatsNew object
    ///   - layout: The WhatsNewView Layout. Default value `.default`
    public init(
        whatsNew: WhatsNew,
        layout: WhatsNewView.Layout = .default
    ) {
        super.init(
            rootView: .init(
                whatsNew: whatsNew,
                layout: layout
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
    ///   - layout: The WhatsNewView Layout. Default value `.default`
    public init?(
        whatsNew: WhatsNew,
        versionStore: WhatsNewVersionStore,
        layout: WhatsNewView.Layout = .default
    ) {
        // Verify WhatsNew Version has not already been presented
        guard !versionStore.hasPresented(version: whatsNew.version) else {
            // Otherwise return nil as WhatsNew Version
            // has already been presented to the user
            return nil
        }
        super.init(
            rootView: .init(
                whatsNew: whatsNew,
                versionStore: versionStore,
                layout: layout
            )
        )
    }
    
    /// Initializer with NSCoder is unavailable.
    /// Please use `init(whatsNew:)` or `init(whatsNew:versionStore:)`
    @available(*, unavailable)
    public required init?(
        coder aDecoder: NSCoder
    ) { nil }
    
}
