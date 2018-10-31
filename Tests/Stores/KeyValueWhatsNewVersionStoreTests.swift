//
//  KeyValueWhatsNewVersionStoreTests.swift
//  WhatsNewKit-iOS Tests
//
//  Created by Sven Tiigi on 01.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import XCTest
@testable import WhatsNewKit

class KeyValueWhatsNewVersionStoreTests: BaseTests {
    
    func testKeyValueStore() {
        class FakeKeyValueable: KeyValueable {
            var objects: [String: Any] = [:]
            func set(_ value: Any?, forKey key: String) {
                self.objects[key] = value
            }
            func object(forKey: String) -> Any? {
                return self.objects[forKey]
            }
        }
        let fakeKeyValueable = FakeKeyValueable()
        let keyValueWhatsNewVersionStore = KeyValueWhatsNewVersionStore(keyValueable: fakeKeyValueable, prefixIdentifier: "unit.test")
        let randomWhatsNewVersion = self.randomWhatsNew.version
        keyValueWhatsNewVersionStore.set(version: randomWhatsNewVersion)
        XCTAssertEqual(randomWhatsNewVersion.description, fakeKeyValueable.objects["unit.test.\(randomWhatsNewVersion.description)"] as? String)
        XCTAssert(keyValueWhatsNewVersionStore.has(version: randomWhatsNewVersion))
        XCTAssertFalse(keyValueWhatsNewVersionStore.has(version: self.generateRandomWhatsNew().version))
    }
    
    func testKeyValueWhatsNewVersionNSUbiquitousKeyValueStore() {
        let iCloudKeyValue = NSUbiquitousKeyValueStore.default
        let version = self.randomWhatsNew.version
        let versionKey = "unit.test.\(version.description)"
        iCloudKeyValue.removeObject(forKey: version.description)
        XCTAssertNil(iCloudKeyValue.object(forKey: versionKey))
        let keyValueWhatsNewVersionStore = KeyValueWhatsNewVersionStore(keyValueable: iCloudKeyValue, prefixIdentifier: "unit.test")
        XCTAssertFalse(keyValueWhatsNewVersionStore.has(version: version))
        keyValueWhatsNewVersionStore.set(version: version)
        XCTAssertTrue(keyValueWhatsNewVersionStore.has(version: version))
        XCTAssertEqual(iCloudKeyValue.object(forKey: versionKey) as? String, version.description)
        iCloudKeyValue.removeObject(forKey: version.description)
    }
    
    func testKeyValueWhatsNewVersionUserDefaultsStore() {
        let userDefaults = UserDefaults.standard
        let version = self.randomWhatsNew.version
        let versionKey = "unit.test.\(version.description)"
        userDefaults.removeObject(forKey: versionKey)
        XCTAssertNil(userDefaults.object(forKey: versionKey))
        let keyValueWhatsNewVersionStore = KeyValueWhatsNewVersionStore(keyValueable: userDefaults, prefixIdentifier: "unit.test")
        XCTAssertFalse(keyValueWhatsNewVersionStore.has(version: version))
        keyValueWhatsNewVersionStore.set(version: version)
        XCTAssertTrue(keyValueWhatsNewVersionStore.has(version: version))
        XCTAssertEqual(userDefaults.object(forKey: versionKey) as? String, version.description)
        userDefaults.removeObject(forKey: versionKey)
    }
    
}

