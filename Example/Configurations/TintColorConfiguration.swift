//
//  TintColorConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit
import WhatsNewKit

/// The TintColorConfiguration
class TintColorConfiguration: Configuration {
    
    /// The Title
    let title: String = "TintColor 🖌"
    
    /// The Subtitle
    let subtitle: String = "Pick a tint color"
    
    /// The Options
    let options = [
        "Blue",
        "LightBlue",
        "Orange",
        "Purple",
        "Red",
        "Green"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {
        let tintColor: UIColor
        switch self.selectedIndex {
        case 0:
            tintColor = .whatsNewKitBlue
        case 1:
            tintColor = .whatsNewKitLightBlue
        case 2:
            tintColor = .orange
        case 3:
            tintColor = .whatsNewKitPurple
        case 4:
            tintColor = .whatsNewKitRed
        case 5:
            tintColor = .whatsNewKitGreen
        default:
            return
        }
        configuration.detailButton?.titleColor = tintColor
        configuration.completionButton.backgroundColor = tintColor
    }
    
}
