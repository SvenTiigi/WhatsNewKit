//
//  BackgroundColorConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The BackgroundColorConfiguration
class BackgroundColorConfiguration: Configuration {
    
    /// The Title
    let title: String = "BackgroundColor 🌄"
    
    /// The Subtitle
    let subtitle: String = "Choose a background color"
    
    /// The Options
    let options = [
        "White",
        "Dark"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {
        if selectedIndex == 0  {
            configuration.apply(theme: .default)
        } else {
            configuration.apply(theme: .darkDefault)
        }
    }
    
}
