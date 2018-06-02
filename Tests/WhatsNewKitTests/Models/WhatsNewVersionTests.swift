//
//  WhatsNewVersionTests.swift
//  WhatsNewKit-iOS Tests
//
//  Created by Sven Tiigi on 24.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import XCTest
@testable import WhatsNewKit

class WhatsNewVersionTests: BaseTests {
    
    func testStringLiteral() {
        let major = self.generateRandomInt()
        let minor = self.generateRandomInt()
        let patch = self.generateRandomInt()
        let versionString = "\(major).\(minor).\(patch)"
        let version = WhatsNew.Version(stringLiteral: versionString)
        XCTAssertEqual(major, version.major)
        XCTAssertEqual(minor, version.minor)
        XCTAssertEqual(patch, version.patch)
        XCTAssertEqual(versionString, version.description)
    }
    
    func testInvalidStringLiteral() {
        let version = WhatsNew.Version(stringLiteral: "")
        XCTAssertEqual(0, version.major)
        XCTAssertEqual(0, version.minor)
        XCTAssertEqual(0, version.patch)
    }
    
    func testCurrentInBundle() {
        class FakeBundle: Bundle {
            override var infoDictionary: [String : Any]? {
                return ["CFBundleShortVersionString": self.version]
            }
            var version: String = ""
        }
        let major = self.generateRandomInt()
        let minor = self.generateRandomInt()
        let patch = self.generateRandomInt()
        let versionString = "\(major).\(minor).\(patch)"
        let fakeBundle = FakeBundle()
        fakeBundle.version = versionString
        let version = WhatsNew.Version.current(inBundle: fakeBundle)
        XCTAssertEqual(major, version.major)
        XCTAssertEqual(minor, version.minor)
        XCTAssertEqual(patch, version.patch)
        XCTAssertEqual(versionString, version.description)
    }
    
}
