//
//  VersionStoreConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 02.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The VersionStoreConfiguration
class VersionStoreConfiguration: Configuration {
    
    /// The Title
    let title: String = "VersionStore 💾"
    
    /// The Subtitle
    let subtitle: String = "Enable or Disable the WhatsNewVersionStore"
    
    /// The Options
    let options = [
        "Disabled",
        "Enabled"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0 {
        didSet {
            if self.selectedIndex == 0 {
                ExampleViewController.versionStore = nil
            }
        }
    }
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {
        if self.selectedIndex == 0 {
            ExampleViewController.versionStore = nil
        } else if ExampleViewController.versionStore == nil {
            ExampleViewController.versionStore = InMemoryWhatsNewVersionStore()
        }
    }
    
}
