//
//  AppDelegate.swift
//  Example
//
//  Created by Sven Tiigi on 18.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit
import WhatsNewKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /// The UINavigationController with ViewController as root viewcontroller
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController(rootViewController: ViewController())
        navigationController.navigationBar.prefersLargeTitles = true
        let tintColor = WhatsNewViewController.Theme.default.tintColor
        navigationController.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: tintColor
        ]
        navigationController.view.backgroundColor = .white
        navigationController.navigationBar.tintColor = tintColor
        navigationController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: tintColor]
        return navigationController
    }()
    
    /// Main Entry Point
    ///
    /// - Parameters:
    ///   - application: The Application
    ///   - launchOptions: The LaunchOptions
    /// - Returns: Boolean
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Initialize Window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // Set root viewcontroller
        self.window?.rootViewController = self.navigationController
        // Make key and visible
        self.window?.makeKeyAndVisible()
        return true
    }
    
}

