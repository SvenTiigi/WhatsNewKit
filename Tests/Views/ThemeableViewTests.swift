//
//  ThemeableViewTests.swift
//  WhatsNewKit-iOS Tests
//
//  Created by Sven Tiigi on 01.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import XCTest
@testable import WhatsNewKit

class ThemableViewTests: BaseTests {

    func testTheme() {
        let theme = WhatsNewViewController.Theme.default
        let themableView = ThemableView(theme: theme)
        XCTAssertEqual(theme, themableView.theme)
    }
    
    func testCoderInitializer() {
        XCTAssertNil(ThemableView(coder: .init()))
    }

}
