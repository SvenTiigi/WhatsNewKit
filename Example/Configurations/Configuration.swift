//
//  Configuration.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation
import WhatsNewKit

/// The Configuration
protocol Configuration {
    
    /// The Title
    var title: String { get }
    
    /// The Subtitle
    var subtitle: String { get }
    
    /// The Options
    var options: [String] { get }
    
    /// The selected Index
    var selectedIndex: Int { get set }
    
    /// Configure WhatsNewViewController.Configuration
    ///
    /// - Parameter configuration: The WhatsNewViewController.Configuration
    func configure(configuration: inout WhatsNewViewController.Configuration)
    
}
