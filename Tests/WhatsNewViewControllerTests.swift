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
    
    func testBackgroundColor() {
        let color = UIColor.purple
        var configuration = WhatsNewViewController.Configuration()
        configuration.backgroundColor = color
        let whatsNewViewController = WhatsNewViewController(whatsNew: self.randomWhatsNew, configuration: configuration)
        XCTAssertEqual(color, whatsNewViewController.view.backgroundColor)
    }
    
    func testPreferredStatusBarStyleLightContent() {
        let color = UIColor.black
        var configuration = WhatsNewViewController.Configuration()
        configuration.backgroundColor = color
        let whatsNewViewController = WhatsNewViewController(whatsNew: self.randomWhatsNew, configuration: configuration)
        XCTAssertEqual(.lightContent, whatsNewViewController.preferredStatusBarStyle)
    }
    
    func testPreferredStatusBarStyleDefault() {
        let color = UIColor.white
        var configuration = WhatsNewViewController.Configuration()
        configuration.backgroundColor = color
        let whatsNewViewController = WhatsNewViewController(whatsNew: self.randomWhatsNew, configuration: configuration)
        XCTAssertEqual(.default, whatsNewViewController.preferredStatusBarStyle)
    }
    
    func testPadAdjustment() {
        WhatsNewViewController.userInterfaceIdiom = .pad
        self.performTest(execution: { expectation in
            var configuration = WhatsNewViewController.Configuration()
            configuration.padAdjustment = { _ in
                expectation.fulfill()
            }
            _ = WhatsNewViewController(whatsNew: self.randomWhatsNew, configuration: configuration)
        }, completionHandler: { _ in
            WhatsNewViewController.userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
        })
    }
    
    func testNoPadAdjustment() {
        WhatsNewViewController.userInterfaceIdiom = .phone
        var configuration = WhatsNewViewController.Configuration()
        configuration.padAdjustment = { _ in
            XCTFail("Pad Adjustment mustn't be called when UserInterfaceIdiom is Phone")
        }
        _ = WhatsNewViewController(whatsNew: self.randomWhatsNew, configuration: configuration)
        WhatsNewViewController.userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
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
