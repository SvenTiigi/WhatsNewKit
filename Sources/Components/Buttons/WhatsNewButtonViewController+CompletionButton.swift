//
//  WhatsNewButtonViewController+CompletionButton.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 02.02.19.
//  Copyright © 2019 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - CompletionButton

extension WhatsNewButtonViewController {
    
    /// The CompletionButton
    class CompletionButton: UIButton {
        
        // MARK: Properties
        
        /// The highlighted background color
        var highlightedBackgroundColor: UIColor = .white
        
        /// The onPress closure
        var onPress: (() -> Void)?
        
        // MARK: Initializer
        
        /// Convenience initializer
        ///
        /// - Parameters:
        ///   - title: The title
        ///   - configuration: The Configuration
        ///   - onPress: The on press closure
        convenience init(title: String,
                         configuration: WhatsNewViewController.Configuration,
                         onPress: @escaping () -> Void) {
            // Init with Custom Type
            self.init(type: .custom)
            // Set onPress closure
            self.onPress = onPress
            // Set highlighted background color
            self.highlightedBackgroundColor = configuration.completionButton.backgroundColor
            // Set title
            self.setTitle(title, for: .normal)
            // Perform configuration
            self.configure(completionButton: configuration.completionButton)
        }
        
        // MARK: ViewLifecycle
        
        /// Layout Subviews
        override func layoutSubviews() {
            super.layoutSubviews()
            // Check if current background image is nil
            if self.currentBackgroundImage == nil {
                // Set the backgroundimage
                self.setBackgroundImage(
                    .from(
                        self.highlightedBackgroundColor,
                        size: self.bounds.size
                    ),
                    for: .normal
                )
            }
        }
        
    }
    
}

// MARK: - Configure

extension WhatsNewButtonViewController.CompletionButton {
    
    /// Configure with CompletionButton configuraton
    ///
    /// - Parameter completionButton: The CompletionButton Configuration
    func configure(completionButton: WhatsNewViewController.CompletionButton) {
        // Set corner radius to rounded button
        self.layer.cornerRadius = completionButton.cornerRadius
        // Set mask to bound
        self.layer.masksToBounds = true
        // Set Content EdgeInsets
        self.contentEdgeInsets = .init(top: 20, left: 20, bottom: 20, right: 20)
        // Set font
        self.titleLabel?.font = completionButton.titleFont
        // Set normal title color
        self.setTitleColor(completionButton.titleColor, for: .normal)
        // Set number of lines
        self.titleLabel?.numberOfLines = 0
        // Set line break mode
        self.titleLabel?.lineBreakMode = .byWordWrapping
        // Add target
        self.addTarget(
            self,
            action: #selector(self.didTouchUpInside),
            for: .touchUpInside
        )
    }
    
}

// MARK: - Target Handler

extension WhatsNewButtonViewController.CompletionButton {
    
    /// Button did touch up inside
    @objc
    func didTouchUpInside() {
        // Invoke onPress closure
        self.onPress?()
    }
    
}

// MARK: - UIImage+From

private extension UIImage {
    
    /// Return a UIImage with a given UIColor and CGSize
    ///
    /// - Parameters:
    ///   - color: The color of the returned UIImage
    ///   - size: The size of the returned UIImage. Default value `width: 1, height: 1`
    /// - Returns: Optional UIImage
    static func from(_ color: UIColor, size: CGSize = .init(width: 1, height: 1)) -> UIImage? {
        // Initialize rect
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        // Begin Graphics Context
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        // Set fill color
        color.setFill()
        // Fill rect with color
        UIRectFill(rect)
        // Retrieve Image from Graphics Context
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        // End Graphics Context
        UIGraphicsEndImageContext()
        // Return image
        return image
    }
    
}
