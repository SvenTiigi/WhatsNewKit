//
//  WhatsNewDetailButton.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 13.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The WhatsNewDetailButton
class WhatsNewDetailButton: UIButton {
    
    // MARK: Properties
    
    /// The onPress closure
    private let onPress: () -> Void
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - detailButton: The DetailButton configuration
    ///   - onPress: The on press closure
    public init(detailButton: WhatsNewViewController.DetailButton?,
                onPress: @escaping () -> Void) {
        self.onPress = onPress
        super.init(frame: .zero)
        self.configure(detailButton: detailButton)
    }
    
    /// Initializer with Coder always returns nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: Private API
    
    /// Configure with DetailButton Configuration
    ///
    /// - Parameter detailButton: The DetailButton Configuration
    private func configure(detailButton: WhatsNewViewController.DetailButton?) {
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
    
    /// Did touch up inside
    @objc private func didTouchUpInside() {
        // Invoke on press closure
        self.onPress()
    }
    
}
