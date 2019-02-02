//
//  ExampleViewController+PresentWhatsNew.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit
import WhatsNewKit

extension ExampleViewController {
    
    /// Present the WhatsNewViewController
    func presentWhatsNewViewController() {
        
        // MARK: Step 1: Initialize the WhatsNew.Items
        
        // Easy Setup Item
        let easySetupItem = WhatsNew.Item(
            title: "Easy Setup",
            subtitle: "The simple and typesafe WhatsNew struct enables you to structurize your awesome new app features",
            image: #imageLiteral(resourceName: "setup")
        )
        // Themes Item
        let themesItem = WhatsNew.Item(
            title: "Themes",
            subtitle: "You can apply different themes to perfectly match with your existing app design",
            image: #imageLiteral(resourceName: "themes")
        )
        // Installation Item
        let installationItem = WhatsNew.Item(
            title: "Installation",
            subtitle: "You can install WhatsNewKit via CocoaPods and Carthage",
            image: #imageLiteral(resourceName: "installation")
        )
        // Open Source Item
        let openSourceItem = WhatsNew.Item(
            title: "Open Source",
            subtitle: "Contributions are\nvery welcome 👨‍💻",
            image: #imageLiteral(resourceName: "openSource")
        )
        
        // MARK: Step 2: Initialize WhatsNew with title and items
        
        // Initialize WhatsNew
        let whatsNew = WhatsNew(
            title: "WhatsNewKit",
            items: [
                easySetupItem,
                themesItem,
                installationItem,
                openSourceItem
            ]
        )
        
        // MARK: Step 3: Initialize a WhatsNewViewController Configuration
        
        // Initialize WhatsNewViewController Configuration in order to customize the Layout and behaviour
        var configuration = WhatsNewViewController.Configuration(
            theme: .default,
            detailButton: .init(
                // Detail Button Title
                title: "Read more",
                // Detail Button Action
                action: .website(url: "https://github.com/SvenTiigi/WhatsNewKit")
            ),
            completionButton: .init(
                // Completion Button Title
                title: "Let's go",
                // Completion Button Action
                action: .dismiss
            )
        )
        
        // Example-Application specific in order to apply configurations that has been selected
        self.configurations.forEach {
            $0.configure(configuration: &configuration)
        }
        
        // MARK: Step 3: Initialize and present a WhatsNewViewController
        
        // Declare WhatsNewViewController
        let whatsNewViewController: WhatsNewViewController?
        
        // Check if a WhatsNewVersionStore is available/enabled
        if let versionStore = ExampleViewController.versionStore {
            // Initialize WhatsNewViewController with WhatsNewVersionStore
            whatsNewViewController = WhatsNewViewController(
                whatsNew: whatsNew,
                configuration: configuration,
                versionStore: versionStore
            )
        } else {
            // Initialize WhatsNewViewController
            whatsNewViewController = WhatsNewViewController(
                whatsNew: whatsNew,
                configuration: configuration
            )
        }
        
        /// Check if WhatsNewViewController is available
        if let controller = whatsNewViewController {
            // Present the WhatsNewViewController
            self.present(controller, animated: true)
        } else {
            // Present already presented Alert
            self.presentAlreadyPresentedAlert()
        }
    }
    
}
