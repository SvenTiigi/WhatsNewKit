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
        let keyValueWhatsNewVersionStore = KeyValueWhatsNewVersionStore(keyValueable: fakeKeyValueable, prefixIdentifier: "")
        
        let randomWhatsNewVersion = self.randomWhatsNew.version
        keyValueWhatsNewVersionStore.set(version: randomWhatsNewVersion)
        XCTAssertEqual(randomWhatsNewVersion.description, fakeKeyValueable.objects[randomWhatsNewVersion.description] as? String)
        XCTAssert(keyValueWhatsNewVersionStore.has(version: randomWhatsNewVersion))
        XCTAssertFalse(keyValueWhatsNewVersionStore.has(version: self.generateRandomWhatsNew().version))
    }
    
}

