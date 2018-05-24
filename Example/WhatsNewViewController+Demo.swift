//
//  WhatsNewViewController+Demo.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 24.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit
import WhatsNewKit

extension WhatsNewViewController {
    
    /// The WhatsNewViewController for demo purpose
    static var demo: WhatsNewViewController {
        
        // MARK: 1.Step Setup WhatsNew Items
        
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
        
        // MARK: 2.Step Setup WhatsNew
        
        // WhatsNew
        let whatsNew = WhatsNew(
            // The Title
            title: "WhatsNewKit",
            // The Items
            items: [
                easySetupItem,
                themesItem,
                installationItem,
                openSourceItem
            ]
        )
        
        // MARK: 3.Step (optional) Setup custom Theme
        
        // The DemoTheme based on WhitePurple Template
        var demoTheme = WhatsNewViewController.Theme.default
        // Update animation
        demoTheme.itemsViewTheme.animation = .slideUp
        
        // MARK: 4.Step Setup WhatsNewViewController Configuration
        
        /// The Configuration
        let configuration = WhatsNewViewController.Configuration(
            // Custom Demo Theme
            theme: demoTheme,
            // DetailButton
            detailButton: .init(
                // Detail Button Title
                title: "Read more",
                // Detail Button Action
                action: .website(url: "https://github.com/SvenTiigi/WhatsNewKit")
            ),
            // CompletionButton
            completionButton: .init(
                // Completion Button Title
                title: "Let's go 🙌",
                // Completion Button Action
                action: .dismiss
            )
        )
        
        // MARK: 5.Step Setup WhatsNewViewController
        
        /// The WhatsNewViewController
        let controller = WhatsNewViewController(
            // WhatsNew
            whatsNew: whatsNew,
            // Configuration
            configuration: configuration
        )
        
        // Return WhatsNewViewController
        return controller
    }
    
    
}
