//
//  WhatsNewTests.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 24.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import XCTest
@testable import WhatsNewKit

class WhatsNewTests: BaseTests {
    
    func testEquatable() {
        let whatsNew = WhatsNew(
            version: .init(major: self.generateRandomInt(), minor: self.generateRandomInt(), patch: self.generateRandomInt()),
            title: self.generateRandomString(),
            items: [WhatsNew.Item(title: self.generateRandomString(), subtitle: self.generateRandomString(), image: nil)]
        )
        let whatsNew2 = WhatsNew(
            version: .init(major: self.generateRandomInt(), minor: self.generateRandomInt(), patch: self.generateRandomInt()),
            title: self.generateRandomString(),
            items: [WhatsNew.Item(title: self.generateRandomString(), subtitle: self.generateRandomString(), image: nil)]
        )
        XCTAssertEqual(whatsNew, whatsNew)
        XCTAssertNotEqual(whatsNew, whatsNew2)
    }
    
}
