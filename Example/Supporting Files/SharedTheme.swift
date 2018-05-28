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
        switch (self.backgroundColor, self.tintColor)  {
        case ("White", "Blue"):
            self.theme = .default
        case ("White", "Orange"):
            self.theme = .whiteOrange
        case ("White", "Purple"):
            self.theme = .whitePurple
        case ("White", "Red"):
            self.theme = .whiteRed
        case ("White", "Green"):
            self.theme = .whiteGreen
        case ("Dark", "Blue"):
            self.theme = .darkDefault
        case ("Dark", "Orange"):
            self.theme = .darkOrange
        case ("Dark", "Purple"):
            self.theme = .darkPurple
        case ("Dark", "Red"):
            self.theme = .darkRed
        case ("Dark", "Green"):
            self.theme = .darkGreen
        default:
            self.theme = .default
        }
        switch self.animation {
        case "None":
            self.theme.itemsViewTheme.animation = .none
        case "Fade":
            self.theme.itemsViewTheme.animation = .fade
        case "SlideUp":
           self.theme.itemsViewTheme.animation = .slideUp
        case "SlideDown":
            self.theme.itemsViewTheme.animation = .slideDown
        case "SlideLeft":
            self.theme.itemsViewTheme.animation = .slideLeft
        case "SlideRight":
            self.theme.itemsViewTheme.animation = .slideRight
        default:
            break
        }
    }
    
}
