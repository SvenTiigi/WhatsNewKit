//
//  WhatsNewItemsView.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - WhatsNewItemsView

/// The WhatsNewItemsView
class WhatsNewItemsView: UIView {
    
    // MARK: Properties
    
    /// The WhatsNew Items
    private let items: [WhatsNew.Item]
    
    /// The Configuration
    private let configuration: WhatsNewViewController.Configuration
    
    /// The cell display count
    private var cellDisplayCount = 0
    
    /// The TableView
    private lazy var tableView: UITableView = {
        // Initialize TableView
        let tableView = UITableView()
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
        super.init(frame: .zero)
        // Set background color
        self.backgroundColor = self.configuration.backgroundColor
        // Add TableView
        self.addSubview(self.tableView)
    }
    
    /// Initializer with Coder always returns nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        // Initialize relative padding
        let relativePadding: CGFloat = 0.05
        // Set TableView frame
        self.tableView.frame = CGRect(
            x: self.frame.size.width * relativePadding,
            y: 0,
            width: self.frame.size.width - self.frame.size.width * relativePadding * 2,
            height: self.frame.size.height
        )
    }
    
}

// MARK: - UITableViewDataSource

extension WhatsNewItemsView: UITableViewDataSource {
    
    /// Retrieve number of sections
    ///
    /// - Parameter tableView: The TableView
    /// - Returns: Amount of section
    public func numberOfSections(in tableView: UITableView) -> Int {
        // Just one section
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
        // Return WhatsNewItemTableViewCell
        return WhatsNewItemTableViewCell(
            item: self.items[indexPath.row],
            configuration: self.configuration
        )
    }
    
}

// MARK: - UITableViewDelegate

extension WhatsNewItemsView: UITableViewDelegate {
    
    /// TableView will display cell
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - cell: The Cell
    ///   - indexPath: The indexPath
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = self.configuration.backgroundColor
        // Unwrap cell as WhatsNewItemTableViewCell and verify cellDisplayCount is less then the items count
        guard let cell = cell as? WhatsNewItemTableViewCell,
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
