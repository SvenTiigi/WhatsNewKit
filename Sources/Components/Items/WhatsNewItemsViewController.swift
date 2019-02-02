//
//  WhatsNewItemsViewController.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 02.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - WhatsNewItemsViewController

/// The WhatsNewItemsViewController
class WhatsNewItemsViewController: UIViewController {
    
    // MARK: Properties
    
    /// The WhatsNew Items
    let items: [WhatsNew.Item]
    
    /// The Configuration
    let configuration: WhatsNewViewController.Configuration
    
    /// The cell display count
    var cellDisplayCount = 0
    
    /// The TableView
    lazy var tableView: UITableView = {
        // Initialize TableView
        let tableView = UITableView(frame: .zero, style: .plain)
        // Set clear background color
        tableView.backgroundColor = .clear
        // Only bounce vertical if space is needed
        tableView.alwaysBounceVertical = false
        // Set data source
        tableView.dataSource = self
        // Set delegate
        tableView.delegate = self
        // Clear table footer view
        tableView.tableFooterView = UIView()
        // No seperators
        tableView.separatorStyle = .none
        // No selection
        tableView.allowsSelection = false
        // Hide Vertical Scroll Indicator
        tableView.showsVerticalScrollIndicator = false
        // Set indicator style based on theme backgroundcolor
        tableView.indicatorStyle = self.configuration.backgroundColor.isLight ? .black : .white
        // Set estimatedRowHeight so autosizing will work on iOS 10
        tableView.estimatedRowHeight = 44.0
        // Set automtic dimension for row height
        tableView.rowHeight = UITableView.automaticDimension
        // Return TableView
        return tableView
    }()
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - items: The WhatsNew Items
    ///   - configuration: The Configuration
    init(items: [WhatsNew.Item],
         configuration: WhatsNewViewController.Configuration) {
        // Set items
        self.items = items
        // Set configuration
        self.configuration = configuration
        // Super init
        super.init(nibName: nil, bundle: nil)
        // Set background color
        self.view.backgroundColor = self.configuration.backgroundColor
    }
    
    /// Initializer with Coder always return nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// Load View
    override func loadView() {
        self.view = self.tableView
    }
    
}

// MARK: - UITableViewDataSource

extension WhatsNewItemsViewController: UITableViewDataSource {
    
    /// Retrieve number of sections
    ///
    /// - Parameter tableView: The TableView
    /// - Returns: Amount of section
    public func numberOfSections(in tableView: UITableView) -> Int {
        // Return one section
        return 1
    }
    
    /// Retrieve number of rows in section
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - section: The section
    /// - Returns: The amount of rows in section
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return items count
        return self.items.count
    }
    
    /// Retrieve cell for row at IndexPath
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - indexPath: The IndexPath
    /// - Returns: The configured Cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Verify row is contained in indicies
        guard self.items.indices.contains(indexPath.row) else {
            // Return unkown TableViewCell
            return UITableViewCell(style: .default, reuseIdentifier: "unkown")
        }
        // Return Cell
        return Cell(
            item: self.items[indexPath.row],
            configuration: self.configuration
        )
    }
    
}

// MARK: - UITableViewDelegate

extension WhatsNewItemsViewController: UITableViewDelegate {
    
    /// TableView will display cell
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - cell: The Cell
    ///   - indexPath: The indexPath
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        cell.backgroundColor = self.configuration.backgroundColor
        // Unwrap cell as Cell and verify cellDisplayCount is less then the items count
        guard let cell = cell as? Cell,
            self.cellDisplayCount < self.items.count else {
                // Return out of function
                return
        }
        // Increment CellDisplayCount
        self.cellDisplayCount += 1
        // Animate Cell
        self.configuration.itemsView.animation?.rawValue(
            cell,
            .init(
                preferredDuration: 0.5,
                preferredDelay: 0.15 * (Double(indexPath.row) + 1.0)
            )
        )
    }
    
}
