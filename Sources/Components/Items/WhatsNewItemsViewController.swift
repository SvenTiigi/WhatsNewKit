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
    
    /// The NotificationCenter
    let notificationCenter: NotificationCenter
    
    /// The cell display count
    var cellDisplayCount = 0
    
    /// Bool if animation is disabled
    var isAnimationDisabled: Bool = false
    
    /// The TableView
    lazy var tableView: UITableView = {
        // Initialize TableView
        let tableView = UITableView(frame: .zero, style: .grouped)
        // Set clear background color
        tableView.backgroundColor = .clear
        // Only bounce vertical if space is needed
        tableView.alwaysBounceVertical = false
        // Set data source
        tableView.dataSource = self
        // Set delegate
        tableView.delegate = self
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
    ///   - notificationCenter: The NotificationCenter. Default value `default`
    init(items: [WhatsNew.Item],
         configuration: WhatsNewViewController.Configuration,
         notificationCenter: NotificationCenter = .default) {
        // Set items
        self.items = items
        // Set configuration
        self.configuration = configuration
        // Set NotificationCenter
        self.notificationCenter = notificationCenter
        // Super init
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Initializer with Coder always return nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    /// Deinit
    deinit {
        // Remove Obser
        self.notificationCenter.removeObserver(self)
    }
    
    // MARK: View-Lifecycle
    
    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set background color
        self.view.backgroundColor = self.configuration.backgroundColor
        // Add orientation did change observer
        self.notificationCenter.addObserver(
            self,
            selector: #selector(self.orientationDidChange),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }
    
    /// Load View
    override func loadView() {
        self.view = self.tableView
    }
    
    /// ScrollView will begin dragging
    ///
    /// - Parameter scrollView: The ScrollView
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // Set is animation disabled to true to improve the user
        // experience when having a large amount of Items
        self.isAnimationDisabled = true
    }
    
}

// MARK: - Notification Target

extension WhatsNewItemsViewController {
    
    /// Orientation did change notification
    ///
    /// - Parameter notification: The Notification
    @objc
    func orientationDidChange(notification: Notification) {
        // Check if the Cell Display count is not zero
        if self.cellDisplayCount != 0 {
            // Set is animation disabled to true
            self.isAnimationDisabled = true
        }
        // Reload TableView
        self.tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource

extension WhatsNewItemsViewController: UITableViewDataSource {
    
    /// Retrieve number of sections
    ///
    /// - Parameter tableView: The TableView
    /// - Returns: Amount of section
    public func numberOfSections(in tableView: UITableView) -> Int {
        // Return items count
        return self.items.count
    }
    
    /// Retrieve number of rows in section
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - section: The section
    /// - Returns: The amount of rows in section
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return one row
        return 1
    }
    
    /// Retrieve cell for row at IndexPath
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - indexPath: The IndexPath
    /// - Returns: The configured Cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Verify section is contained in indicies
        guard self.items.indices.contains(indexPath.section) else {
            // Return unkown TableViewCell
            return UITableViewCell(style: .default, reuseIdentifier: "unkown")
        }
        // Return Cell
        return Cell(
            item: self.items[indexPath.section],
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
            !self.isAnimationDisabled,
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
                preferredDelay: 0.15 * (Double(indexPath.section) + 1.0)
            )
        )
    }
    
    /// Height for Header in section
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - section: The Section
    /// - Returns: The Header Height
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return self.calculateSpace(
            for: .header,
            in: section,
            contentMode: self.configuration.itemsView.contentMode
        )
    }
    
    /// Height for Footer in section
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - section: The Section
    /// - Returns: The Footer Height
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        return self.calculateSpace(
            for: .footer,
            in: section,
            contentMode: self.configuration.itemsView.contentMode
        )
    }
    
    /// View for Header in Section
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - section: The Section
    /// - Returns: The Header View
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    /// View for Footer in Section
    ///
    /// - Parameters:
    ///   - tableView: The TableView
    ///   - section: The Section
    /// - Returns: The Footer View
    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}

// MARK: - Calculate Space

extension WhatsNewItemsViewController {
    
    /// The Position
    enum Position: String, Codable, Equatable, Hashable, CaseIterable {
        /// Header
        case header
        /// Footer
        case footer
    }
    
    /// Calculate Space for Position in Section
    ///
    /// - Parameters:
    ///   - position: The Position
    ///   - section: The Section
    ///   - contentMode: The ContentMode
    /// - Returns: The calculcated Space
    func calculateSpace(for position: Position,
                        in section: Int,
                        contentMode: WhatsNewViewController.ItemsView.ContentMode) -> CGFloat {
        // Declare Divider
        var divider: CGFloat
        // Switch on ContentMode
        switch contentMode {
        case .top:
            // Return zero Space
            return 0
        case .center:
            // Switch on position
            switch position {
            case .header:
                // Verify Section is first
                guard section == 0 else {
                    // Otherwise return zero
                    return 0
                }
            case .footer:
                // Verify Setion is last
                guard section == self.numberOfSections(in: self.tableView) - 1 else {
                    // Otherwise return zero
                    return 0
                }
            }
            // Initialize Divider
            divider = 2
        case .fill:
            // Check if Items count is one
            if self.items.count == 1 {
                // Return calculated Space with Center ContentMode
                return self.calculateSpace(
                    for: position,
                    in: section,
                    contentMode: .center
                )
            }
            // Switch on position
            switch position {
            case .header:
                return 0
            case .footer:
                // Verify Setion is not last
                guard section != self.numberOfSections(in: self.tableView) - 1 else {
                    // Otherwise return zero
                    return 0
                }
            }
            // Initialize Divider
            divider = .init(self.numberOfSections(in: self.tableView) - 1)
        }
        // Check if divider is zero
        if divider == 0 {
            // Re-Initializer Divider with one
            divider = 1
        }
        // Initialize Height via combining all visible Cells heights
        let height = self.tableView.visibleCells.map { $0.frame.size.height }.reduce(0, +)
        // Initialize Space
        let space = (self.view.bounds.height - height) / divider
        // Verify Space is not negative
        guard space >= 10 else {
            // Otherwise return zero
            return 0
        }
        // Return space
        return space
    }
    
}
