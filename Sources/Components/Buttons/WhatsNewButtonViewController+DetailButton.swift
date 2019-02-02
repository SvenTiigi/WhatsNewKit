//
//  WhatsNewButtonViewController+DetailButton.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 02.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - DetailButton

extension WhatsNewButtonViewController {
    
    /// The DetailButton
    class DetailButton: UIButton {
        
        // MARK: Properties
        
        /// The onPress closure
        let onPress: () -> Void
        
        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - detailButton: The DetailButton configuration
        ///   - onPress: The on press closure
        init(detailButton: WhatsNewViewController.DetailButton?,
             onPress: @escaping () -> Void) {
            // Set on press
            self.onPress = onPress
            // Super init
            super.init(frame: .zero)
            // Configure DetailButton
            self.configure(detailButton: detailButton)
        }
        
        /// Initializer with Coder always returns nil
        required init?(coder aDecoder: NSCoder) {
            return nil
        }
        
    }
    
}

// MARK: - Configure

extension WhatsNewButtonViewController.DetailButton {
    
    /// Configure with DetailButton Configuration
    ///
    /// - Parameter detailButton: The DetailButton Configuration
    func configure(detailButton: WhatsNewViewController.DetailButton?) {
        // Set title
        self.setTitle(
            detailButton?.title,
            for: .normal
        )
        // Add target
        self.addTarget(
            self,
            action: #selector(self.didTouchUpInside),
            for: .touchUpInside
        )
        // Set title color
        self.setTitleColor(
            detailButton?.titleColor,
            for: .normal
        )
        // Set font
        self.titleLabel?.font = detailButton?.titleFont
    }
    
}

// MARK: - Target Handler

extension WhatsNewButtonViewController.DetailButton {
    
    /// Did touch up inside
    @objc
    func didTouchUpInside() {
        // Invoke on press closure
        self.onPress()
    }
    
}
