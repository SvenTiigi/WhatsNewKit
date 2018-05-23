//
//  ViewController.swift
//  Example
//
//  Created by Sven Tiigi on 18.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit
import WhatsNewKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let easySetupItem = WhatsNew.Item(
            title: "Easy Setup",
            text: "The simple and typesafe WhatsNew struct enables you to structurize your awesome new app features",
            image: #imageLiteral(resourceName: "setup")
        )
        
        let themesItem = WhatsNew.Item(
            title: "Themes",
            text: "You can apply different themes to perfectly match with your existing app design",
            image: #imageLiteral(resourceName: "themes")
        )
        
        let installationItem = WhatsNew.Item(
            title: "Installation",
            text: "You can install WhatsNewKit via CocoaPods and Carthage",
            image: #imageLiteral(resourceName: "installation")
        )
        
        let documentationItem = WhatsNew.Item(
            title: "Open Source",
            text: "Contributions are\nvery welcome 🙌 👨‍💻",
            image: #imageLiteral(resourceName: "contributing")
        )
        
        let whatsNew = WhatsNew(
            version: "1.0.0",
            title: "WhatsNewKit",
            items: easySetupItem, themesItem, installationItem, documentationItem,
            detailButtonTitle: "Read more",
            completionButtonTitle: "Let's go 🙌"
        )
        
        var demoTheme = WhatsNewViewController.Theme.darkPurple
        demoTheme.titleViewTheme.titleColor = demoTheme.completionButtonTheme.backgroundColor
        demoTheme.titleViewTheme.titleFont = .systemFont(ofSize: 30, weight: .semibold)
        demoTheme.itemsViewTheme.animator = .default
        
        let controller = WhatsNewViewController(
            whatsNew: whatsNew,
            theme: demoTheme,
            onDetail: .website(url: "https://github.com/SvenTiigi/WhatsNewKit")
        )
        
        self.present(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

