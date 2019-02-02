//
//  UIViewController+AddChild.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 02.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - Add ChildViewController

extension UIViewController {
    
    /// Add ChildViewController
    ///
    /// - Parameter child: The ChildViewController
    func add(_ child: UIViewController) {
        // Add Child
        self.addChild(child)
        // Add Child View
        self.view.addSubview(child.view)
        // Inovke didMove to parent
        child.didMove(toParent: self)
    }
    
    /// Add ChildViewController with Constraints
    ///
    /// - Parameters:
    ///   - child: The ChildViewController
    ///   - constraints: The Constraints
    func add(_ child: UIViewController, constraints: [NSLayoutConstraint]) {
        // Add ChildViewController
        self.add(child)
        // Adctivate Constraints
        NSLayoutConstraint.activate(on: child.view, constraints)
    }
    
}
