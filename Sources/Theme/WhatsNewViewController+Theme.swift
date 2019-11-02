//
//  WhatsNewViewController+Theme.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 02.11.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Theme

public extension WhatsNewViewController {
    
    /// The Customization typealias for an inout Configuration closure
    typealias Customization = (inout Configuration) -> Void
    
    /// The Theme
    struct Theme {
        
        /// The Customization closure
        let customization: Customization
        
        /// Default initializer
        ///
        /// - Parameter customization: The Customization
        public init(customization: @escaping Customization) {
            self.customization = customization
        }
        
    }
    
}

// MARK: - Default Template Theme

public extension WhatsNewViewController.Theme {
    
    /// The default Theme
    static var `default`: WhatsNewViewController.Theme {
        return .blue
    }
    
}

// MARK: - Blue Theme

public extension WhatsNewViewController.Theme {
    
    /// Default Theme
    static var blue: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitBackground
            configuration.apply(textColor: .whatsNewKitForeground)
            configuration.tintColor = .whatsNewKitBlue
        }
    }
    
    /// White Blue Theme (white background and blue tint color)
    static var whiteBlue: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitWhite
            configuration.apply(textColor: .whatsNewKitBlack)
            configuration.tintColor = .whatsNewKitBlue
        }
    }
    
    /// Dark Blue Theme (dark background and blue tint color)
    static var darkBlue: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitDark
            configuration.apply(textColor: .whatsNewKitWhite)
            configuration.tintColor = .whatsNewKitBlue
        }
    }
    
}

// MARK: - LightBlue Theme

public extension WhatsNewViewController.Theme {
    
    /// LightBlue Theme
    static var lightBlue: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitBackground
            configuration.apply(textColor: .whatsNewKitForeground)
            configuration.tintColor = .whatsNewKitLightBlue
        }
    }
    
    /// White LightBlue Theme (white background and light blue tint color)
    static var whiteLightBlue: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitWhite
            configuration.apply(textColor: .whatsNewKitBlack)
            configuration.tintColor = .whatsNewKitLightBlue
        }
    }
    
    /// Dark LightBlue Theme (dark background and light blue tint color)
    static var darkLightBlue: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitDark
            configuration.apply(textColor: .whatsNewKitWhite)
            configuration.tintColor = .whatsNewKitLightBlue
        }
    }
    
}

// MARK: - Orange Theme

public extension WhatsNewViewController.Theme {
    
    /// Orange Theme
    static var orange: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitBackground
            configuration.apply(textColor: .whatsNewKitForeground)
            configuration.tintColor = .orange
        }
    }
    
    /// White Orange Theme (white background and orange tint color)
    static var whiteOrange: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitWhite
            configuration.apply(textColor: .whatsNewKitBlack)
            configuration.tintColor = .orange
        }
    }
    
    /// Dark Orange Theme (dark background and orange tint color)
    static var darkOrange: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitDark
            configuration.apply(textColor: .whatsNewKitWhite)
            configuration.tintColor = .orange
        }
    }
    
}

// MARK: - Purple Theme

public extension WhatsNewViewController.Theme {
    
    /// Purple Theme
    static var purple: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitBackground
            configuration.apply(textColor: .whatsNewKitForeground)
            configuration.tintColor = .whatsNewKitPurple
        }
    }
    
    /// White Purple Theme (white background and purple tint color)
    static var whitePurple: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitWhite
            configuration.apply(textColor: .whatsNewKitBlack)
            configuration.tintColor = .whatsNewKitPurple
        }
    }
    
    /// Dark Purple Theme (dark background and purple tint color)
    static var darkPurple: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitDark
            configuration.apply(textColor: .whatsNewKitWhite)
            configuration.tintColor = .whatsNewKitPurple
        }
    }
    
}

// MARK: - Red Theme

public extension WhatsNewViewController.Theme {
    
    /// Red Theme
    static var red: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitBackground
            configuration.apply(textColor: .whatsNewKitForeground)
            configuration.tintColor = .whatsNewKitRed
        }
    }
    
    /// White Red Theme (white background and red tint color)
    static var whiteRed: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitWhite
            configuration.apply(textColor: .whatsNewKitBlack)
            configuration.tintColor = .whatsNewKitRed
        }
    }
    
    /// Dark Red Theme (dark background and red tint color)
    static var darkRed: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitDark
            configuration.apply(textColor: .whatsNewKitWhite)
            configuration.tintColor = .whatsNewKitRed
        }
    }
    
}

// MARK: - Green Theme

public extension WhatsNewViewController.Theme {
    
    /// Green Theme
    static var green: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitBackground
            configuration.apply(textColor: .whatsNewKitForeground)
            configuration.tintColor = .whatsNewKitGreen
        }
    }
    
    /// White Green Theme (white background and green tint color)
    static var whiteGreen: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitWhite
            configuration.apply(textColor: .whatsNewKitBlack)
            configuration.tintColor = .whatsNewKitGreen
        }
    }
    
    /// Dark Green Theme (dark background and green tint color)
    static var darkGreen: WhatsNewViewController.Theme {
        return .init { configuration in
            configuration.backgroundColor = .whatsNewKitDark
            configuration.apply(textColor: .whatsNewKitWhite)
            configuration.tintColor = .whatsNewKitGreen
        }
    }
    
}
