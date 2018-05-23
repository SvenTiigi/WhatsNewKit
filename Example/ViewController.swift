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
        let item1 = WhatsNew.Item(title: "Neues User-Interface", text: "Ein ganz neues User-Interface erwartet dich sei gespannt", image: #imageLiteral(resourceName: "pencil"))
        let item2 = WhatsNew.Item(title: "Neuer Network-Service", text: "Bessere Netzwerkkommunikation damit Daten noch schneller", image: #imageLiteral(resourceName: "box"))
        let item3 = WhatsNew.Item(title: "Social Media Integration", text: "Jetzt sind alle Social Media Dienste verfügbar probier es aus", image: #imageLiteral(resourceName: "sun"))
        let whatsNew = WhatsNew(version: "0.0.1", title: "New in WhatsNewKit", items: item1, item2, item3, detailButtonTitle: "All news", completionButtonTitle: "Let's go")
        let controller = WhatsNewViewController(whatsNew: whatsNew, theme: .whiteOrange)
        self.present(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

