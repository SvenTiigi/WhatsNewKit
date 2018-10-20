//
//  LayoutConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The LayoutConfiguration
class LayoutConfiguration: Configuration {
    
    /// The Title
    let title: String = "Layout 📐"
    
    /// The Subtitle
    let subtitle: String = "Define the Layout"
    
    /// The Options
    let options = [
        "Default",
        "Centered"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {
        if self.selectedIndex == 0 {
            configuration.itemsView.layout = .default
        } else {
            configuration.itemsView.layout = .centered
        }
    }
    
}
