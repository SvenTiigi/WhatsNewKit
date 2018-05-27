//
//  WhatsNewViewControllerTests.swift
//  WhatsNewKit-iOS Tests
//
//  Created by Sven Tiigi on 26.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import XCTest
@testable import WhatsNewKit

class WhatsNewViewControllerTests: BaseTests {
    
    func testAvailableVersionInVersionStore() {
        let versionStore = InMemoryWhatsNewVersionStore()
        versionStore.set(version: self.randomWhatsNew.version)
        XCTAssertNil(WhatsNewViewController(whatsNew: self.randomWhatsNew, versionStore: versionStore))
    }
    
    func testUnavailableVersionInVersionStore() {
        let versionStore = InMemoryWhatsNewVersionStore()
        let whatsNewViewController = WhatsNewViewController(whatsNew: self.randomWhatsNew, versionStore: versionStore)
        XCTAssertNotNil(whatsNewViewController)
        whatsNewViewController?.handleOnPress(buttonType: .completion)
        XCTAssert(versionStore.has(version: self.randomWhatsNew.version))
    }
    
}
