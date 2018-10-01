//
//  ViewController2.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 28.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit
import WhatsNewKit
import SafariServices

// MARK: - ExampleViewController

/// The ExampleViewController
/// ☝️ Head over to the WhatsNewViewController+Demo.swift file to see how WhatsNewViewController will be configured
class ExampleViewController: UITableViewController {
    
    // MARK: Properties
    
    /// The Item Enumeration
    enum Item: String {
        /// BackgroundColor
        case backgroundColor = "BackgroundColor 🌄"
        /// TintColor
        case tintColor = "TintColor 🖌"
        /// Animation
        case titleViewAnimation = "TitleView Animation 🎬"
        case itemsViewAnimation = "ItemsView Animation 🎬"
        case detailButtonAnimation = "DetailButton Animation 🎬"
        case completionButtonAnimation = "CompletionButton Animation 🎬"
        /// Layout
        case layout = "Layout 📐"
        /// The Options
        var options: [String] {
            switch self {
            case .backgroundColor:
                return ["White", "Dark"]
            case .tintColor:
                return ["Blue", "LightBlue", "Orange", "Purple", "Red", "Green"]
            case .titleViewAnimation, .itemsViewAnimation, .detailButtonAnimation, .completionButtonAnimation:
                return ["None", "Fade", "SlideUp", "SlideDown", "SlideLeft", "SlideRight"]
            case .layout:
                return ["Default", "Centered"]
            }
        }
    }
    
    /// The items
    private lazy var items: [Item] = [
        .backgroundColor,
        .tintColor,
        .titleViewAnimation,
        .itemsViewAnimation,
        .detailButtonAnimation,
        .completionButtonAnimation,
        .layout
    ]
    
    /// The SharedTheme
    private lazy var sharedTheme = SharedTheme()
    
    private lazy var cells: [UITableViewCell] = {
        var cells: [UITableViewCell] = self.items.map {
            ItemCell(item: $0, sharedTheme: self.sharedTheme)
        }
        cells.append(ButtonCell(onPress: { [weak self] in
            self?.presentWhatsNewViewController()
        }))
        return cells
    }()
    
    // MARK: Initializer

    /// Default initializer
    init() {
        // Init with Groupe Style
        super.init(style: .grouped)
        // Add Bottom inset
        self.tableView.contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 50,
            right: 0
        )
    }
    
    /// Init with Coder always returns nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "WhatsNewKit"
        let githubBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "githubIconSmall"),
            style: .plain,
            target: self,
            action: #selector(githubBarButtonItemTouched)
        )
        self.navigationItem.rightBarButtonItem = githubBarButtonItem
    }
    
    // MARK: Action Handler
    
    /// Github BarButtonItem touched handler
    @objc private func githubBarButtonItemTouched() {
        guard let url = URL(string: "https://github.com/SvenTiigi/WhatsNewKit/blob/master/README.md") else {
            print("Unable to construct Github Repo URL")
            return
        }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .main
        self.present(safariViewController, animated: true)
    }
    
    private func presentWhatsNewViewController() {
        let controller = WhatsNewViewController.demo(withTheme: self.sharedTheme.theme)
        self.present(controller, animated: true)
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return Items count plus 1 ButtoNcell
        return self.cells.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1 Row
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.cells[indexPath.section]
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Check if section is greater items count
        if section == self.cells.count - 1 {
            // Empty title
            return ""
        } else {
            // Return Item rawValue
            return self.items[section].rawValue
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 60 height
        return 60
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        // Return empty title for footer (a little bit spacing)
        return ""
    }

}
