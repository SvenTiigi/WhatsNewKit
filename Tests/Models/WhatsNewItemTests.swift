//
//  WhatsNewItemTests.swift
//  WhatsNewKit-iOS Tests
//
//  Created by Sven Tiigi on 01.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import XCTest
@testable import WhatsNewKit

class WhatsNewItemTests: BaseTests {
    
    func testCodableWithImage() {
        let whatsNewItem = WhatsNew.Item(
            title: self.generateRandomString(),
            subtitle: self.generateRandomString(),
            image: self.image
        )
        let data: Data
        do {
            data = try JSONEncoder().encode(whatsNewItem)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        let whatsNewItemDecoded: WhatsNew.Item
        do {
            whatsNewItemDecoded = try JSONDecoder().decode(WhatsNew.Item.self, from: data)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        XCTAssertEqual(whatsNewItem.title, whatsNewItemDecoded.title)
        XCTAssertEqual(whatsNewItem.subtitle, whatsNewItemDecoded.subtitle)
        XCTAssertNotNil(whatsNewItemDecoded.image)
    }
    
    func testCodableNoImage() {
        let whatsNewItem = WhatsNew.Item(
            title: self.generateRandomString(),
            subtitle: self.generateRandomString(),
            image: nil
        )
        let data: Data
        do {
            data = try JSONEncoder().encode(whatsNewItem)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        let whatsNewItemDecoded: WhatsNew.Item
        do {
            whatsNewItemDecoded = try JSONDecoder().decode(WhatsNew.Item.self, from: data)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        XCTAssertEqual(whatsNewItem.title, whatsNewItemDecoded.title)
        XCTAssertEqual(whatsNewItem.subtitle, whatsNewItemDecoded.subtitle)
        XCTAssertNil(whatsNewItem.image)
    }
    
}
