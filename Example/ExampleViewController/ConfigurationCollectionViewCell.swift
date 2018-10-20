//
//  ConfigurationCollectionViewCell.swift
//  WhatsNewKit-Example
//
//  Created by Sven Tiigi on 20.10.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The ConfigurationCollectionViewCell
class ConfigurationCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {

    // MARK: Properties

    /// The TitleLabel
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    /// Boolean if is selected
    override var isSelected: Bool {
        didSet {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.9,
                initialSpringVelocity: 0,
                options: .curveLinear,
                animations: { [weak self] in
                    if self?.isSelected == true {
                        self?.backgroundColor = .main
                        self?.transform = CGAffineTransform(
                            scaleX: 1.09,
                            y: 1.07
                        )
                    } else {
                        self?.transform = .identity
                        self?.backgroundColor = .mainGray
                    }
                }
            )
        }
    }
    
    // MARK: Initializer
    
    /// Designated Initializer
    ///
    /// - Parameter frame: The Frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Add TitleLabel
        self.contentView.addSubview(self.titleLabel)
        // Add Corner Radius
        self.layer.cornerRadius = 10
        // Set default BackgroundColor
        self.backgroundColor = .mainGray
    }
    
    /// Initializer with Coder always return nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.frame = self.contentView.bounds
    }
    
}
