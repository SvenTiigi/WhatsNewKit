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
    
    func testGetByVersion() {
        let whatsNew1 = self.generateRandomWhatsNew()
        let whatsNew2 = self.generateRandomWhatsNew()
        let targetVersion = whatsNew1.version
        let whatsNews = [whatsNew1, whatsNew2]
        XCTAssertEqual(whatsNew1, whatsNews.get(byVersion: targetVersion))
    }

    func testGetByBundle() {
        let whatsNew1 = self.generateRandomWhatsNew()
        let whatsNew2 = self.generateRandomWhatsNew()
        class FakeBundle: Bundle {
            var version: WhatsNew.Version?
            override var infoDictionary: [String : Any]? {
                guard let version = self.version?.description else {
                    return nil
                }
                return ["CFBundleShortVersionString": version]
            }
        }
        let fakeBundle = FakeBundle()
        fakeBundle.version = whatsNew1.version
        let whatsNews = [whatsNew1, whatsNew2]
        XCTAssertEqual(whatsNew1, whatsNews.get(byBundle: fakeBundle))
    }
    
}
