//
//  AnimationConfiguration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The AnimationConfiguration
class AnimationConfiguration: Configuration {
    
    /// The Title
    let title: String = "Animation 🎬"
    
    /// The Subtitle
    let subtitle: String = "Select an animation"
    
    /// The Options
    let options = [
        "None",
        "Fade",
        "Slide\nUp",
        "Slide\nDown",
        "Slide\nLeft",
        "Slide\nRight"
    ]
    
    /// The selected Index
    var selectedIndex: Int = 0
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration) {
        let animation: WhatsNewViewController.Animation
        switch self.selectedIndex {
        case 0:
            return
        case 1:
            animation = .fade
        case 2:
            animation = .slideUp
        case 3:
            animation = .slideDown
        case 4:
            animation = .slideLeft
        case 5:
            animation = .slideRight
        default:
            return
        }
        configuration.apply(animation: animation)
    }
    
}
