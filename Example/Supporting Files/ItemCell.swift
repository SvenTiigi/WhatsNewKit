//
//  ItemCell.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 28.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit
import WhatsNewKit

extension ExampleViewController {
    
    /// The ItemCell
    class ItemCell: UITableViewCell {
        
        // MARK: Properties
        
        /// The Item
        private let item: Item
        
        /// The SharedTheme
        private let sharedTheme: SharedTheme
        
        /// The segmented control
        lazy var segmentedControl: UISegmentedControl = {
            let segmentedControl = UISegmentedControl(items: self.item.options)
            segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
            segmentedControl.selectedSegmentIndex = 0
            segmentedControl.tintColor = .main
            return segmentedControl
        }()
        
        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - item: The Item
        ///   - sharedTheme: The SharedTheme
        init(item: Item, sharedTheme: SharedTheme) {
            self.item = item
            self.sharedTheme = sharedTheme
            super.init(style: .default, reuseIdentifier: "ItemCell")
            self.contentView.addSubview(self.segmentedControl)
            self.selectionStyle = .none
        }
        
        /// Initializer with Coder always return nil
        required init?(coder aDecoder: NSCoder) {
            return nil
        }
        
        // MARK: View-Lifecycle
        
        /// Layout Subviews
        override func layoutSubviews() {
            super.layoutSubviews()
            self.segmentedControl.frame = CGRect(
                x: 10,
                y: self.contentView.frame.size.height / 2 - self.segmentedControl.frame.size.height / 2,
                width: self.contentView.frame.size.width - 10 * 2,
                height: self.segmentedControl.frame.size.height
            )
        }
        
        // MARK: Action Handler
        
        /// SegmentedControl value changed action handler
        @objc private func segmentedControlValueChanged() {
            let selected = self.item.options[self.segmentedControl.selectedSegmentIndex]
            switch self.item {
            case .backgroundColor:
                self.sharedTheme.backgroundColor = selected
            case .tintColor:
                self.sharedTheme.tintColor = selected
            case .animation:
                self.sharedTheme.animation = selected
            }
        }
        
    }

}
