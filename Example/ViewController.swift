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

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(WhatsNewViewController.Theme.default.tintColor, for: .normal)
        button.addTarget(self, action: #selector(self.presentWhatsNewViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "WhatsNewKit"
        self.view.addSubview(self.button)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.button.frame = self.view.frame
    }
    
    @objc private func presentWhatsNewViewController() {
        let controller = WhatsNewViewController.demo
        self.present(controller, animated: true)
    }

}

