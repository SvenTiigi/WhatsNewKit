import XCTest
@testable import WhatsNewKit

// MARK: - WhatsNewVersionStoreTests

/// The WhatsNewVersionStoreTests
final class WhatsNewVersionStoreTests: WhatsNewKitTestCase {
    
    func testInMemoryWhatsNewVersionStore() {
        let inMemoryWhatsNewVersionStore = InMemoryWhatsNewVersionStore()
        let version = self.executeVersionStoreTest(inMemoryWhatsNewVersionStore)
        XCTAssertEqual(
            [version],
            inMemoryWhatsNewVersionStore.versions
        )
    }
    
    func testUserDefaultsWhatsNewVersionStore() {
        final class FakeUserDefaults: UserDefaults {
            var store: [String: Any] = .init()
            
            override func set(_ value: Any?, forKey defaultName: String) {
                self.store[defaultName] = value
            }
            
            override func dictionaryRepresentation() -> [String: Any] {
                self.store
            }
        }
        let fakeUserDefaults = FakeUserDefaults()
        let version = self.executeVersionStoreTest(
            UserDefaultsWhatsNewVersionStore(
                userDefaults: fakeUserDefaults
            )
        )
        XCTAssertEqual(
            fakeUserDefaults.store.count,
            1
        )
        XCTAssertEqual(
            version,
            (fakeUserDefaults.store[version.key] as? String).flatMap(WhatsNew.Version.init)
        )
    }
    
    func testNSUbiquitousKeyValueWhatsNewVersionStore() {
        final class FakeNSUbiquitousKeyValueStore: NSUbiquitousKeyValueStore {
            var store: [String: Any] = .init()
            
            override var dictionaryRepresentation: [String: Any] {
                self.store
            }
            
            override func set(_ value: Any?, forKey defaultName: String) {
                self.store[defaultName] = value
            }
        }
        let fakeNSUbiquitousKeyValueStore = FakeNSUbiquitousKeyValueStore()
        let version = self.executeVersionStoreTest(
            NSUbiquitousKeyValueWhatsNewVersionStore(
                ubiquitousKeyValueStore: fakeNSUbiquitousKeyValueStore
            )
        )
        XCTAssertEqual(
            fakeNSUbiquitousKeyValueStore.store.count,
            1
        )
        XCTAssertEqual(
            version,
            (fakeNSUbiquitousKeyValueStore.store[version.key] as? String).flatMap(WhatsNew.Version.init)
        )
    }
    
}

private extension WhatsNewVersionStoreTests {
    
    func executeVersionStoreTest(
        _ versionStore: WhatsNewVersionStore
    ) -> WhatsNew.Version {
        let version = self.makeRandomWhatsNewVersion()
        XCTAssert(versionStore.presentedVersions.isEmpty)
        XCTAssertFalse(versionStore.hasPresented(version))
        versionStore.save(
            presentedVersion: version
        )
        XCTAssertEqual([version], versionStore.presentedVersions)
        XCTAssert(versionStore.hasPresented(version))
        return version
    }
    
}
