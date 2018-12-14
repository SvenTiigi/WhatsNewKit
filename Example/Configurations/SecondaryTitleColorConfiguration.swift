//
//  SecondaryTitleColorConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 14.12.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The SecondaryTitleColorConfiguration
class SecondaryTitleColorConfiguration: Configuration {
    
    /// The Title
    let title: String = "Secondary Title Color 🖍"
    
    /// The Subtitle
    let subtitle: String = "Enable or Disable the secondary title color"
    
    /// The Options
    let options = [
        "Disabled",
        "Enabled"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {
        if self.selectedIndex == 0 {
            configuration.titleView.secondaryColor = nil
        } else {
            configuration.titleView.secondaryColor = .init(
                startIndex: 0,
                length: 5,
                color: configuration.tintColor
            )
        }
    }
    
}
