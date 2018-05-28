//
//  ButtonCell.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 28.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - ButtonCell

extension ExampleViewController {
    
    /// The ButtonCell
    class ButtonCell: UITableViewCell {
        
        // MARK: Properies
        
        /// The onPress closure
        private let onPress: () -> Void
        
        /// The present button
        private lazy var button: PresentButton = {
            let button = PresentButton(
                title: "Show",
                tintColor: .main
            )
            button.addTarget(
                self,
                action: #selector(self.buttonPressed),
                for: .touchUpInside
            )
            return button
        }()
        
        // MARK: Initializer
        
        /// Default initializer
        ///
        /// - Parameter onPress: The onPress closure
        init(onPress: @escaping () -> Void) {
            self.onPress = onPress
            super.init(style: .default, reuseIdentifier: "ButtonCell")
            self.contentView.backgroundColor = .clear
            self.backgroundColor = .clear
            self.contentView.addSubview(self.button)
        }
        
        /// Initializer with Coder always return nil
        required init?(coder aDecoder: NSCoder) {
            return nil
        }
        
        // MARK: View-Lifecycle
        
        /// Layout SubViews
        override func layoutSubviews() {
            super.layoutSubviews()
            let height: CGFloat = 60
            let padding: CGFloat = 10
            self.button.frame = CGRect(
                x: padding,
                y: self.contentView.frame.size.height / 2 - height / 2,
                width: self.contentView.frame.size.width - padding * 2,
                height: height
            )
        }
        
        // MARK: Action Handler
        
        /// Button was pressed
        @objc private func buttonPressed() {
            // Invoke onPress
            self.onPress()
        }
        
    }
    
}

// MARK: - PresentButton

extension ExampleViewController.ButtonCell {
    
    /// The PresentButton
    class PresentButton: UIButton {
        
        // MARK: Properties
        
        /// The highlighted background color
        private var highlightedBackgroundColor: UIColor = .white
        
        // MARK: Initializer
        
        /// Convenience initializer
        convenience init(title: String, tintColor: UIColor) {
            self.init(type: .custom)
            self.highlightedBackgroundColor = tintColor
            self.setTitle(title, for: .normal)
            self.titleLabel?.numberOfLines = 0
            self.titleLabel?.lineBreakMode = .byWordWrapping
            self.titleLabel?.textColor = tintColor
            self.layer.cornerRadius = 8.0
            self.layer.masksToBounds = true
            self.setTitleColor(.white, for: .normal)
        }
        
        // MARK: ViewLifecycle
        
        override func layoutSubviews() {
            super.layoutSubviews()
            // Check if current background image is nil
            if self.currentBackgroundImage == nil {
                // Set the backgroundimage
                self.setBackgroundImage(
                    self.getImageWithColor(
                        self.highlightedBackgroundColor,
                        size: self.bounds.size
                    ),
                    for: .normal
                )
            }
        }
        
        // MARK: Helper functions
        
        /// Return a UIImage with a given UIColor and CGSize
        ///
        /// - Parameters:
        ///   - color: The color of the returned UIImage
        ///   - size: The size of the returned UIImage
        /// - Returns: Optional UIImage
        private func getImageWithColor(_ color: UIColor, size: CGSize) -> UIImage? {
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            color.setFill()
            UIRectFill(rect)
            let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
        
    }
    
}
