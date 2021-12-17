import XCTest
@testable import WhatsNewKit

// MARK: - WhatsNewVersionTests

/// The WhatsNewVersionTests
final class WhatsNewVersionTests: WhatsNewKitTestCase {
    
    func testStringLiteral() {
        let whatsNewVersionString = "9.9.9"
        let whatsNewVersion = WhatsNew.Version(stringLiteral: whatsNewVersionString)
        XCTAssertEqual(
            whatsNewVersionString,
            whatsNewVersion.description
        )
    }
    
    func testBadStringLiteral() {
        let whatsNewVersionString = UUID().uuidString
        let whatsNewVersion = WhatsNew.Version(stringLiteral: whatsNewVersionString)
        XCTAssertEqual(
            "0.0.0",
            whatsNewVersion.description
        )
    }
    
    func testComparable() {
        let sortedVersions: [WhatsNew.Version] = [
            "1.0.0",
            "1.0.1",
            "1.1.1",
            "1.1.2",
            "1.2.0",
            "2.0.0",
            "2.0.1",
            "2.1.0"
        ]
        XCTAssertEqual(
            sortedVersions,
            sortedVersions.shuffled().sorted(by: <)
        )
    }
    
    func testCurrent() {
        class FakeBundle: Bundle {
            let shortVersionString: String
            init(shortVersionString: String) {
                self.shortVersionString = shortVersionString
                super.init()
            }
            override var infoDictionary: [String : Any]? {
                [
                    "CFBundleShortVersionString": self.shortVersionString
                ]
            }
        }
        let version = self.makeRandomWhatsNewVersion()
        let fakeBundle = FakeBundle(shortVersionString: version.description)
        XCTAssertEqual(
            version,
            WhatsNew.Version.current(in: fakeBundle)
        )
        let fakeBundleEmptyVersion = FakeBundle(shortVersionString: "")
        XCTAssertEqual(
            WhatsNew.Version(major: 0, minor: 0, patch: 0),
            WhatsNew.Version.current(in: fakeBundleEmptyVersion)
        )
    }
    
    func testKeyPrefix() {
        XCTAssertEqual(
            "WhatsNewKit",
            WhatsNew.Version.keyPrefix
        )
    }
    
    func testKey() {
        let version = self.makeRandomWhatsNewVersion()
        XCTAssertEqual(
            "WhatsNewKit.\(version.description)",
            version.key
        )
    }
    
}
