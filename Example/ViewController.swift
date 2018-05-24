//
//  ViewController.swift
//  Example
//
//  Created by Sven Tiigi on 18.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import SafariServices
import UIKit
import WhatsNewKit

class ViewController: UIViewController {
    
    private let tintColor = WhatsNewViewController.Theme.default.tintColor

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(self.tintColor, for: .normal)
        button.addTarget(self, action: #selector(self.presentWhatsNewViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationItems()
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
    
    /// Add navigation items
    private func addNavigationItems() {
        self.title = "WhatsNewKit"
        let githubBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "githubIconSmall"),
            style: .plain,
            target: self,
            action: #selector(githubBarButtonItemTouched)
        )
        self.navigationItem.rightBarButtonItem = githubBarButtonItem
    }
    
    /// Github BarButtonItem touched handler
    @objc private func githubBarButtonItemTouched() {
        guard let url = URL(string: "https://github.com/SvenTiigi/WhatsNewKit/blob/master/README.md") else {
            print("Unable to construct Github Repo URL")
            return
        }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = self.tintColor
        self.present(safariViewController, animated: true)
    }

}

