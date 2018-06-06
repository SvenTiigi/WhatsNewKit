//
//  SharedTheme.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 28.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit
import WhatsNewKit

/// The SharedTheme
class SharedTheme {
    
    // MARK: Properties
    
    /// The Theme
    private(set) var theme: WhatsNewViewController.Theme
    
    /// Background Color String
    var backgroundColor: String = "White" {
        didSet {
            self.updateTheme()
        }
    }
    
    /// TintColor String
    var tintColor: String = "Blue" {
        didSet {
            self.updateTheme()
        }
    }
    
    /// Animation String
    var animation: String = "None" {
        didSet {
            self.updateTheme()
        }
    }
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameter theme: The Theme. Default value `.default`
    init(theme: WhatsNewViewController.Theme = .default) {
        self.theme = theme
    }
    
    // MARK: Private API
    
    /// Update the Theme
    private func updateTheme() {
        self.theme = .init { configuration in
            switch (self.backgroundColor, self.tintColor)  {
            case ("White", "Blue"):
                configuration.apply(theme: .default)
            case ("White", "Orange"):
                configuration.apply(theme: .whiteOrange)
            case ("White", "Purple"):
                configuration.apply(theme: .whitePurple)
            case ("White", "Red"):
                configuration.apply(theme: .whiteRed)
            case ("White", "Green"):
                configuration.apply(theme: .whiteGreen)
            case ("Dark", "Blue"):
                configuration.apply(theme: .darkDefault)
            case ("Dark", "Orange"):
                configuration.apply(theme: .darkOrange)
            case ("Dark", "Purple"):
                configuration.apply(theme: .darkPurple)
            case ("Dark", "Red"):
                configuration.apply(theme: .darkRed)
            case ("Dark", "Green"):
                configuration.apply(theme: .darkGreen)
            default:
                configuration.apply(theme: .default)
            }
            switch self.animation {
            case "None":
                configuration.itemsView.animation = .none
            case "Fade":
                configuration.itemsView.animation = .fade
            case "SlideUp":
                configuration.itemsView.animation = .slideUp
            case "SlideDown":
                configuration.itemsView.animation = .slideDown
            case "SlideLeft":
                configuration.itemsView.animation = .slideLeft
            case "SlideRight":
                configuration.itemsView.animation = .slideRight
            default:
                break
            }
        }
    }
    
}
