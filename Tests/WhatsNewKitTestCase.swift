import XCTest
@testable import WhatsNewKit

// MARK: - WhatsNewKitTestCase

/// The WhatsNewKitTestCase
class WhatsNewKitTestCase: XCTestCase {
    
    // MARK: XCTestCase-Lifecycle
    
    /// Provides an opportunity to reset state before calling each test method in a test case.
    override func setUp() {
        super.setUp()
        // Disable continueAfterFailure
        self.continueAfterFailure = false
    }
    
    // MARK: Convenience Functions
    
    /// Make a random WhatsNew Version
    func makeRandomWhatsNewVersion() -> WhatsNew.Version {
        let randomVersionRange = 0...9
        return .init(
            major: .random(in: randomVersionRange),
            minor: .random(in: randomVersionRange),
            patch: .random(in: randomVersionRange)
        )
    }
    
    /// Create a WhatsNew instance from a given WhatsNew Version
    /// - Parameter version: The WhatsNew Version
    func makeWhatsNew(
        from version: WhatsNew.Version
    ) -> WhatsNew {
        .init(
            version: version,
            title: "",
            features: .init()
        )
    }
    
}
