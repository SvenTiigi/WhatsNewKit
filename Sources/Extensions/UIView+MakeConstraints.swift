//
//  UIView+MakeConstraints.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 11.04.20.
//  Copyright © 2020 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Make Constraints

extension UIView {
    
    /// Make Constraints
    /// - Parameter constraints: The NSLayoutConstraints that should be added to the View
    func makeConstraints(_ constraints: NSLayoutConstraint...) {
        // Disable translates Autoresizing Mask Into Constraints
        self.translatesAutoresizingMaskIntoConstraints = false
        // Activate the given Constraints
        NSLayoutConstraint.activate(constraints)
    }
    
}
