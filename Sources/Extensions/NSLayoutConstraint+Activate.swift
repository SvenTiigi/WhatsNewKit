//
//  NSLayoutConstraint+Activate.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 02.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - NSLayoutConstraint+Activate

extension NSLayoutConstraint {
    
    /// Activate on View
    ///
    /// - Parameters:
    ///   - view: The View
    ///   - constraints: The Constraints
    static func activate(on view: UIView, _ constraints: [NSLayoutConstraint]) {
        // Disable translate AutoresizingMask intro Constraints
        view.translatesAutoresizingMaskIntoConstraints = false
        // Activate Constraints
        self.activate(constraints)
    }
    
}

// MARK: - Anchor

/// The Anchor Protocol
protocol Anchor {
    
    /// The Top Anchor
    var topAnchor: NSLayoutYAxisAnchor { get }
    
    /// The Bottom Anchor
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    
    /// The Leading Anchor
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    
    /// The Trailing Anchor
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    
    /// The Width Anchor
    var widthAnchor: NSLayoutDimension { get }
    
    /// The Height Anchor
    var heightAnchor: NSLayoutDimension { get }
    
    /// The center x anchor
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    
    /// The center y anchor
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    
}

// MARK: - UIView+Anchor

extension UIView: Anchor {
    
    /// Add Subview with Constraints
    ///
    /// - Parameters:
    ///   - view: The Subview
    ///   - constraints: The Constraints
    func addSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        self.addSubview(view)
        NSLayoutConstraint.activate(on: view, constraints)
    }
    
}

// MARK: - UILayoutGuide+Anchor

extension UILayoutGuide: Anchor {}

// MARK: - UIViewController+Anchor

extension UIViewController {
    
    /// The Anchor
    var anchor: Anchor {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaLayoutGuide
        } else {
            return self.view
        }
    }
    
}
