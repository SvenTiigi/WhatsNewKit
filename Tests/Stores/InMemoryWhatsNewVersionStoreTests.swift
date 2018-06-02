//
//  InMemoryWhatsNewVersionStoreTests.swift
//  WhatsNewKit-iOS Tests
//
//  Created by Sven Tiigi on 01.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import XCTest
@testable import WhatsNewKit

class InMemoryWhatsNewVersionStoreTests: BaseTests {

    func testInMemory() {
        let randomWhatsNewVersion = self.randomWhatsNew.version
        let inMemoryWhatsNewVersionStore = InMemoryWhatsNewVersionStore()
        XCTAssertFalse(inMemoryWhatsNewVersionStore.has(version: randomWhatsNewVersion))
        inMemoryWhatsNewVersionStore.set(version: randomWhatsNewVersion)
        XCTAssert(inMemoryWhatsNewVersionStore.has(version: randomWhatsNewVersion))
        inMemoryWhatsNewVersionStore.clearVersions()
        XCTAssertFalse(inMemoryWhatsNewVersionStore.has(version: randomWhatsNewVersion))
    }
    
}
