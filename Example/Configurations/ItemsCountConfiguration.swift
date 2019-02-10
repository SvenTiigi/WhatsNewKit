//
//  ItemsCountConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 10.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The ItemsCountConfiguration
class ItemsCountConfiguration: Configuration {
    
    /// The Title
    let title: String = "Number of Items 📏"
    
    /// The Subtitle
    let subtitle: String = "Set the amount of visible items"
    
    /// The Options
    let options = [
        "4",
        "3",
        "2",
        "1",
        "Many"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0 {
        didSet {
            guard self.options.indices.contains(self.selectedIndex) else {
                return
            }
            let selectedOption = self.options[self.selectedIndex]
            if let numberOfVisibleItems = Int(selectedOption) {
                ExampleViewController.numberOfVisibleItems = numberOfVisibleItems
            } else if selectedOption == "Many" {
                ExampleViewController.numberOfVisibleItems = 5
            }
        }
    }
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {}
    
}
