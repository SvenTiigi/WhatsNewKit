//
//  ContentModeConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 10.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The ContentModeConfiguration
class ContentModeConfiguration: Configuration {
    
    /// The Title
    let title: String = "ContentMode 📏"
    
    /// The Subtitle
    let subtitle: String = "Configure the ContentMode"
    
    /// The Options
    let options = [
        "Top",
        "Center",
        "Fill"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {
        if self.selectedIndex == 0 {
            configuration.itemsView.contentMode = .top
        } else if self.selectedIndex == 1 {
            configuration.itemsView.contentMode = .center
        } else {
            configuration.itemsView.contentMode = .fill
        }
    }
    
}
