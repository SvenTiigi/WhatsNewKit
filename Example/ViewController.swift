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

    private lazy var button: PresentButton = {
        let button = PresentButton(title: "Show", tintColor: self.tintColor)
        button.addTarget(self, action: #selector(self.presentWhatsNewViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var backgroundColorSegmentedControl: TitledSegmentedControl = .init(
        title: "BackgroundColor 🌄",
        tintColor: self.tintColor,
        items: ["White", "Dark"]
    )
    
    private lazy var tintColorSegmentedControl: TitledSegmentedControl = .init(
        title: "TintColor 🖌",
        tintColor: self.tintColor,
        items: ["Blue", "Orange", "Purple", "Red", "Green"]
    )
    
    private lazy var animationSegmentedControl: TitledSegmentedControl = .init(
        title: "Animation 🎬",
        tintColor: self.tintColor,
        items: ["None", "Fade", "SlideUp", "SlideDown", "SlideLeft", "SlideRight"]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationItems()
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1)
        self.view.addSubview(self.button)
        self.view.addSubview(self.tintColorSegmentedControl)
        self.view.addSubview(self.backgroundColorSegmentedControl)
        self.view.addSubview(self.animationSegmentedControl)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let frame = self.view.frame
        let padding: CGFloat = 10
        self.backgroundColorSegmentedControl.frame = CGRect(
            x: 0,
            y: padding,
            width: frame.width,
            height: frame.height * 0.25 - padding
        )
        self.tintColorSegmentedControl.frame = CGRect(
            x: 0,
            y: frame.height * 0.25 + padding,
            width: frame.width,
            height: frame.height * 0.25 - padding
        )
        self.animationSegmentedControl.frame = CGRect(
            x: 0,
            y: frame.height * 0.5 + padding,
            width: frame.width,
            height: frame.height * 0.25 - padding
        )
        self.button.frame = CGRect(
            x: padding,
            y: frame.height * 0.75 + (frame.height * 0.25) / 4 ,
            width: frame.width - padding * 2,
            height: 60
        )
    }
    
    @objc private func presentWhatsNewViewController() {
        let controller = WhatsNewViewController.demo(withTheme: self.demoTheme)
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

// MARK: Demo Theme Generator

extension ViewController {
    
    var demoTheme: WhatsNewViewController.Theme {
        var theme: WhatsNewViewController.Theme
        switch (self.backgroundColorSegmentedControl.selectedItem, self.tintColorSegmentedControl.selectedItem)  {
        case ("White", "Blue"):
            theme = .default
        case ("White", "Orange"):
            theme = .whiteOrange
        case ("White", "Purple"):
            theme = .whitePurple
        case ("White", "Red"):
            theme = .whiteRed
        case ("White", "Green"):
            theme = .whiteGreen
        case ("Dark", "Blue"):
            theme = .darkDefault
        case ("Dark", "Orange"):
            theme = .darkOrange
        case ("Dark", "Purple"):
            theme = .darkPurple
        case ("Dark", "Red"):
            theme = .darkRed
        case ("Dark", "Green"):
            theme = .darkGreen
        default:
            theme = .default
        }
        switch self.animationSegmentedControl.selectedItem {
        case "None":
            theme.itemsViewTheme.animation = .none
        case "Fade":
            theme.itemsViewTheme.animation = .fade
        case "SlideUp":
            theme.itemsViewTheme.animation = .slideUp
        case "SlideDown":
            theme.itemsViewTheme.animation = .slideDown
        case "SlideLeft":
            theme.itemsViewTheme.animation = .slideLeft
        case "SlideRight":
            theme.itemsViewTheme.animation = .slideRight
        default:
            break
        }
        return theme
    }
    
}

