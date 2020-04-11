//
//  TitleModeConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Timothy Ellis on 11/4/20.
//  Copyright © 2020 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The TitleModeConfiguration
class TitleModeConfiguration: Configuration {
    
    /// The Title
    let title: String = "Title Mode 🔧"
    
    /// The Subtitle
    let subtitle: String = "Define how the title will be shown"
    
    /// The Options
    let options = [
        "Fixed",
        "Scrolls"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {
        if self.selectedIndex == 0 {
            configuration.titleView.titleMode = .fixed
        } else if self.selectedIndex == 1 {
            configuration.titleView.titleMode = .scrolls
        }
    }
    
}
