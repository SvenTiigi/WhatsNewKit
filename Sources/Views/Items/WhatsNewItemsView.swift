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
    
    /// The TableView
    private lazy var tableView: UITableView = {
        // Initialize TableView
        let tableView = UITableView()
        // Set clear background color
        tableView.backgroundColor = .clear
        // Only bounce vertical if space is needed
        tableView.alwaysBounceVertical = false
        // set data source
        tableView.dataSource = self
        // Clear table footer view
        tableView.tableFooterView = UIView()
        // No seperators
        tableView.separatorStyle = .none
        // No selection
        tableView.allowsSelection = false
        return tableView
    }()
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - items: The WhatsNew Items
    ///   - backgroundColor: The background color
    init(items: [WhatsNew.Item],
         backgroundColor: UIColor) {
        // Set items
        self.items = items
        // Super init zero frame
        super.init(frame: .zero)
        // Set background color
        self.backgroundColor = backgroundColor
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
        let relativePadding: CGFloat = 0.05
        // Set TableView frame
        self.tableView.frame = CGRect(
            x: 0,
            y: 0,
            width: self.frame.size.width - self.frame.size.width * relativePadding,
            height: self.frame.size.height
        )
    }
    
}

// MARK: - UITableViewDataSource

extension WhatsNewItemsView: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        // Simply one section
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return items count
        return self.items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Verify row is contained in indicies
        guard self.items.indices.contains(indexPath.row) else {
            // Return unkown TableViewCell
            return UITableViewCell(style: .default, reuseIdentifier: "unkown")
        }
        // Return WhatsNewItemTableViewCell
        return WhatsNewItemTableViewCell(
            item: self.items[indexPath.row],
            backgroundColor: self.backgroundColor
        )
    }
    
}
