//
//  SpacingConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 03.11.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The SpacingConfiguration
class SpacingConfiguration: Configuration {
    
    /// The Title
    let title: String = "Spacing "
    
    /// The Subtitle
    let subtitle: String = "Select the Spacing"
    
    /// The Options
    let options = [
        "Default",
        "Automatic"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {
        if self.selectedIndex == 0 {
            configuration.itemsView.spacing = .default
        } else {
            configuration.itemsView.spacing = .automatic
        }
    }
    
}
