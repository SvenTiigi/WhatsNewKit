//
//  TitledSegmentedControl.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 24.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

class TitledSegmentedControl: UIView {
    
    private let title: String
    
    private let items: [String]
    
    var selectedItem: String {
        if self.items.indices.contains(self.segmentedControl.selectedSegmentIndex) {
            return self.items[self.segmentedControl.selectedSegmentIndex]
        } else {
            return ""
        }
    }
    
    private let customTintColor: UIColor
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.text = self.title
        return label
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: self.items)
        segmentedControl.tintColor = self.customTintColor
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    init(title: String, tintColor: UIColor, items: [String]) {
        self.title = title
        self.customTintColor = tintColor
        self.items = items
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.addSubview(self.titleLabel)
        self.addSubview(self.segmentedControl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 10
        self.titleLabel.frame = CGRect(
            x: padding,
            y: padding,
            width: self.frame.size.width - padding * 2,
            height: self.frame.size.height * 0.4
        )
        self.segmentedControl.frame = CGRect(
            x: 10,
            y: (self.frame.size.height + self.titleLabel.frame.size.height + padding) / 2 - self.segmentedControl.frame.size.height / 2,
            width: self.frame.size.width - padding * 2,
            height: self.segmentedControl.frame.size.height
        )
    }
    
}
