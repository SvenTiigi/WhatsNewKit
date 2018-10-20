//
//  HapticFeedbackConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The HapticFeedbackConfiguration
class HapticFeedbackConfiguration: Configuration {
    
    /// The Title
    let title: String = "HaptifFeedback 📳"
    
    /// The Subtitle
    let subtitle: String = "Enable or Disable the HapticFeedback"
    
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
            configuration.completionButton.hapticFeedback = nil
            configuration.detailButton?.hapticFeedback = nil
        } else {
            configuration.completionButton.hapticFeedback = .impact(.medium)
            configuration.detailButton?.hapticFeedback = .impact(.medium)
        }
    }
    
}
