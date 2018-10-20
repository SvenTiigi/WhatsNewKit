//
//  ConfigurationsTableViewCell.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - ConfigurationsTableViewCellDelegate

/// The ConfigurationsTableViewCellDelegate
protocol ConfigurationsTableViewCellDelegate: class {
    
    /// Did select Option
    ///
    /// - Parameter option: The selected option string
    func didSelect(option: String?)
    
}

// MARK: - ConfigurationsTableViewCell

/// The ConfigurationsTableViewCell
class ConfigurationsTableViewCell: UITableViewCell, ReuseIdentifiable {
    
    // MARK: Properties
    
    /// The Configuration
    var configuration: Configuration
    
    /// The Delegate
    weak var delegate: ConfigurationsTableViewCellDelegate?
    
    /// The CollectionView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(
            ConfigurationCollectionViewCell.self,
            forCellWithReuseIdentifier: ConfigurationCollectionViewCell.reuseIdentifier
        )
        return collectionView
    }()
    
    // MARK: Initializer
    
    /// Designated Initializer with Configuration
    ///
    /// - Parameter configuration: The Configuration
    init(configuration: Configuration) {
        // Set Configuration
        self.configuration = configuration
        // Super init
        super.init(
            style: .default,
            reuseIdentifier: ConfigurationCollectionViewCell.reuseIdentifier
        )
        // Add CollectionView
        self.contentView.addSubview(self.collectionView)
        // Pre-Select the first Item
        self.collectionView.selectItem(
            at: IndexPath(item: 0, section: 0),
            animated: false,
            scrollPosition: .left
        )
    }
    
    /// Initializer with Coder always return nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// Layout SubViews
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.frame = self.contentView.bounds
    }
    
}

// MARK: - UICollectionViewDataSource

extension ConfigurationsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // There is only one section
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        // Return the options count
        return self.configuration.options.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue Cell
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ConfigurationCollectionViewCell.reuseIdentifier,
            for: indexPath
        )
        // Check if Cell is a ConfigurationCollectionViewCell
        if let cell = cell as? ConfigurationCollectionViewCell {
            // Set Option Text
            cell.titleLabel.text = self.configuration.options[indexPath.item]
        }
        // Return Cell
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension ConfigurationsTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        // Update the selected Index
        self.configuration.selectedIndex = indexPath.item
        // Invoke delegate
        self.delegate?.didSelect(option: self.configuration.options[safe: indexPath.item])
    }
    
}
