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
        whatsNewViewController?.handlePress(buttonType: .completion)
        XCTAssert(versionStore.has(version: self.randomWhatsNew.version))
    }
    
    func testWhatsNewPassedToControllerEquatable() {
        let whatsNewViewController = WhatsNewViewController(whatsNew: self.randomWhatsNew)
        XCTAssertEqual(self.randomWhatsNew, whatsNewViewController.whatsNew)
    }
    
    func testCoderInitializer() {
        XCTAssertNil(WhatsNewViewController(coder: .init()))
    }
    
    func testPresent() {
        let whatsNewViewController = WhatsNewViewController(whatsNew: self.randomWhatsNew)
        class FakeViewController: UIViewController {
            var viewControllerToPresent: UIViewController?
            var shouldAnimate: Bool?
            override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
                self.viewControllerToPresent = viewControllerToPresent
                self.shouldAnimate = flag
                completion?()
            }
        }
        let fakeViewViewController = FakeViewController()
        let animated = true
        self.performTest(execution: { expectation in
            whatsNewViewController.present(on: fakeViewViewController, animated: animated, completion: {
                XCTAssert(fakeViewViewController.viewControllerToPresent === whatsNewViewController)
                XCTAssertEqual(fakeViewViewController.shouldAnimate, true)
                expectation.fulfill()
            })
        })
    }
    
    func testPush() {
        let whatsNewViewController = WhatsNewViewController(whatsNew: self.randomWhatsNew)
        class FakeNavigationController: UINavigationController {
            var pushedViewController: UIViewController?
            var shouldAnimate: Bool?
            override func pushViewController(_ viewController: UIViewController, animated: Bool) {
                self.pushedViewController = viewController
                self.shouldAnimate = animated
            }
        }
        let fakeNavigationController = FakeNavigationController()
        let animated = true
        whatsNewViewController.push(on: fakeNavigationController, animated: animated)
        XCTAssert(fakeNavigationController.pushedViewController === whatsNewViewController)
        XCTAssertEqual(fakeNavigationController.shouldAnimate, animated)
    }
    
}
