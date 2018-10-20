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

    /// The UIWindow
    var window: UIWindow?
    
    /// The UINavigationController with ViewController as root viewcontroller
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController(rootViewController: ExampleViewController())
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.main
        ]
        navigationController.view.backgroundColor = .white
        navigationController.navigationBar.tintColor = .main
        navigationController.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.main
        ]
        return navigationController
    }()
    
    /// Main Entry Point
    ///
    /// - Parameters:
    ///   - application: The Application
    ///   - launchOptions: The LaunchOptions
    /// - Returns: Boolean
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // Set root viewcontroller
        self.window?.rootViewController = self.navigationController
        // Make key and visible
        self.window?.makeKeyAndVisible()
        return true
    }
    
}

