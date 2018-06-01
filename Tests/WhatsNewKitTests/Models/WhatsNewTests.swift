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
        let whatsNew2 = self.generateRandomWhatsNew()
        XCTAssertEqual(self.randomWhatsNew, self.randomWhatsNew)
        XCTAssertNotEqual(self.randomWhatsNew, whatsNew2)
    }
    
}
