import XCTest
@testable import WhatsNewKit

// MARK: - WhatsNewViewControllerTests

/// The WhatsNewViewControllerTests
final class WhatsNewViewControllerTests: WhatsNewKitTestCase {
    
    func testInitializer() {
        let versionStore = InMemoryWhatsNewVersionStore()
        let whatsNew = self.makeWhatsNew(from: self.makeRandomWhatsNewVersion())
        XCTAssertNotNil(
            WhatsNewViewController(
                whatsNew: whatsNew,
                versionStore: versionStore
            )
        )
        versionStore.save(presentedVersion: whatsNew.version)
        XCTAssertNil(
            WhatsNewViewController(
                whatsNew: whatsNew,
                versionStore: versionStore
            )
        )
    }
    
}
