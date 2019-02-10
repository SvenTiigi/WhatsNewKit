//
//  ExampleViewController.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit
import SafariServices
import WhatsNewKit

// MARK: - ExampleViewController

/// The ExampleViewController
class ExampleViewController: UIViewController {
    
    // MARK: Properties
    
    /// The static WhatsNewVersionStore
    static var versionStore: WhatsNewVersionStore?
    
    /// The number of visible Items
    static var numberOfVisibleItems: Int = 4
    
    /// The maximum number of visible Items
    static let maximumNumberOfVisibleItems: Int = 4
    
    /// The HeaderView
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.addSubview(self.demoImageView)
        view.addSubview(self.textLabel)
        view.addSubview(self.dividerLine)
        view.frame.size.height = 420
        return view
    }()
    
    /// The DemoImageView
    lazy var demoImageView: UIImageView = {
        let imageView = UIImageView(image: .whitePreview)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    /// The TextLabel
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "WhatsNewKit enables you to easily showcase your awesome new app features"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .whatsNewKitDark
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    /// The DividerLine
    lazy var dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = .mainGray
        return view
    }()
    
    /// The TableView
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.tableHeaderView = self.headerView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 50,
            right: 0
        )
        return tableView
    }()
    
    /// The Configurations
    lazy var configurations: [Configuration] = [
        BackgroundColorConfiguration(),
        TintColorConfiguration(),
        AnimationConfiguration(),
        VersionStoreConfiguration(),
        LayoutConfiguration(),
        ContentModeConfiguration(),
        HapticFeedbackConfiguration(),
        SecondaryTitleColorConfiguration(),
        ItemsCountConfiguration()
    ]
    
    /// The Cells
    lazy var cells: [UITableViewCell] = self.configurations.map {
        let cell = ConfigurationsTableViewCell(configuration: $0)
        cell.delegate = self
        return cell
    }
    
    // MARK: Initializer

    /// Designated Initializer
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Required Initializer with Coder always return nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Title
        self.title = "WhatsNewKit"
        // Configure NavigationItem
        self.configure(navigationItem: self.navigationItem)
        // Configure Toolbar
        self.configureToolbar()
    }
    
    /// LoadView
    override func loadView() {
        // Replace View with TableView
        self.view = self.tableView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.demoImageView.frame = CGRect(
            x: 0,
            y: 25,
            width: self.headerView.frame.width,
            height: 300
        )
        self.textLabel.frame = CGRect(
            x: 20,
            y: self.demoImageView.frame.maxY + 10,
            width: self.headerView.frame.width - 40,
            height: self.headerView.frame.height - self.demoImageView.frame.maxY - 10 - 1
        )
        self.dividerLine.frame = CGRect(x: 20, y: self.textLabel.frame.maxY, width: self.headerView.frame.width - 40, height: 1)
    }
    
    // MARK: Customization
    
    /// Configure NavigationItem
    ///
    /// - Parameter navigationItem: The NavigationItem
    func configure(navigationItem: UINavigationItem) {
        // Initialize GitHub BarButtonItem
        let gitHubBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "githubIconSmall"),
            style: .plain,
            target: self,
            action: #selector(self.gitHubBarButtonItemTouched)
        )
        navigationItem.rightBarButtonItem = gitHubBarButtonItem
    }
    
    /// Confiugure Toolbar
    func configureToolbar() {
        // Show Toolbar
        self.navigationController?.setToolbarHidden(false, animated: false)
        // Initialize FlexibleSpace BarButtonItem
        let flexibleSpaceBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
        )
        // Initialize Present BarButtonItem
        let presentBarButtonItem = UIBarButtonItem(
            title: "Present 🤩",
            style: .done ,
            target: self,
            action: #selector(self.presentBarButtonItemTouched)
        )
        presentBarButtonItem.tintColor = .main
        // Set Toolbar Item
        self.setToolbarItems(
            [flexibleSpaceBarButtonItem, presentBarButtonItem, flexibleSpaceBarButtonItem],
            animated: false
        )
    }
    
    // MARK: BarButton Selectors
    
    /// Present GitHub ReadMe SafariViewController
    @objc
    private func gitHubBarButtonItemTouched(sender: UIBarButtonItem) {
        // Verify URL can be constructed
        guard let url = URL(string: "https://github.com/SvenTiigi/WhatsNewKit/blob/master/README.md") else {
            print("Unable to construct GitHub Repo URL")
            return
        }
        // Initialize SafariViewController with URL
        let safariViewController = SFSafariViewController(url: url)
        // Set tint color
        safariViewController.preferredControlTintColor = .main
        // Present SafariViewController
        self.present(safariViewController, animated: true)
    }
    
    @objc
    func presentBarButtonItemTouched(sender: UIBarButtonItem) {
        self.presentWhatsNewViewController()
    }
    
}

// MARK: - UITableViewDataSource

extension ExampleViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.configurations.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.cells[safe: indexPath.section] ?? UITableViewCell(style: .default, reuseIdentifier: "invalidCell")
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return self.configurations[safe: section]?.title
    }
    
    func tableView(_ tableView: UITableView,
                   titleForFooterInSection section: Int) -> String? {
        return self.configurations[safe: section]?.subtitle
    }
    
}

// MARK: - UITableViewDelegate

extension ExampleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}


// MARK: - ConfigurationsTableViewCellDelegate

extension ExampleViewController: ConfigurationsTableViewCellDelegate {
    
    /// Did select Option
    ///
    /// - Parameter option: The selected option string
    func didSelect(option: String?) {
        if option == "White" {
            self.demoImageView.image = .whitePreview
        }
        if option == "Dark" {
            self.demoImageView.image = .darkPreview
        }
    }
    
}

// MARK: - Already Presented

extension ExampleViewController {
    
    /// Present already Presented Alert
    func presentAlreadyPresentedAlert() {
        let alertController = UIAlertController(
            title: "WhatsNewVersionStore",
            message: "The Version \(WhatsNew.Version.current().description) has already been presented",
            preferredStyle: .alert
        )
        let confirmAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true)
    }
    
}
