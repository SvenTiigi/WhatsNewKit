//
//  WhatsNewViewController.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import SafariServices
import UIKit

/// The WhatsNewViewController
public class WhatsNewViewController: UIViewController {
    
    // MARK: Properties
    
    /// The preferred status bar style
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.view.backgroundColor?.isLight == true ? .default : .lightContent
    }
    
    /// The WhatsNew
    public let whatsNew: WhatsNew
    
    /// The Configuration
    var configuration: Configuration
    
    /// The VersionStore
    var versionStore: WhatsNewVersionStore?
    
    /// The TitleViewController
    lazy var titleViewController: UIViewController = WhatsNewTitleViewController(
        title: self.whatsNew.title,
        configuration: self.configuration
    )
    
    /// The ItemsViewController
    lazy var itemsViewController: UIViewController = WhatsNewItemsViewController(
        items: self.whatsNew.items,
        configuration: self.configuration
    )
    
    /// The ButtonViewController
    lazy var buttonViewController: UIViewController = WhatsNewButtonViewController(
        configuration: self.configuration,
        onPress: { [weak self] buttonType in
            // Handle Button Press
            self?.handlePress(buttonType: buttonType)
        }
    )
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - whatsNew: The WhatsNew
    ///   - configuration: The Configuration
    public init(whatsNew: WhatsNew,
                configuration: Configuration = .init()) {
        // Set WhatsNew
        self.whatsNew = whatsNew
        // Set Configuration
        self.configuration = configuration
        // Super init
        super.init(nibName: nil, bundle: nil)
        // Check if Device is iPad
        if UIDevice.current.userInterfaceIdiom == .pad {
            // Invoke iPad Adjustment closure
            self.configuration.padAdjustment(&self.configuration)
        }
    }
    
    /// Convenience optional initializer with WhatsNewVersionStore.
    /// Initializer checks via WhatsNewVersionStore if Version has already been presented.
    /// If a Version has been found the initializer will return nil.
    ///
    /// - Parameters:
    ///   - whatsNew: The WhatsNew
    ///   - configuration: The Configuration
    ///   - versionStore: The WhatsNewVersionStore
    public convenience init?(whatsNew: WhatsNew,
                             configuration: Configuration = .init(),
                             versionStore: WhatsNewVersionStore) {
        // Check if VersionStore has version
        if versionStore.has(version: whatsNew.version) {
            // Return nil
            return nil
        }
        // Self init with WhatsNew and Configuration
        self.init(
            whatsNew: whatsNew,
            configuration: configuration
        )
        // Set VersionStore
        self.versionStore = versionStore
    }
    
    /// Initializer with Coder always returns nil
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// View did load
    public override func viewDidLoad() {
        // Invoke super
        super.viewDidLoad()
        // Set background color
        self.view.backgroundColor = self.configuration.backgroundColor
        // Add Subviews
        self.addSubviews()
    }

}

// MARK: - Add Subviews

extension WhatsNewViewController {
    
    /// Add Subviews
    func addSubviews() {
        // Add TitleViewController with Constraints
        self.add(self.titleViewController, constraints: [
            self.titleViewController.view.topAnchor.constraint(
                equalTo: self.anchor.topAnchor,
                constant: self.configuration.titleView.insets.top
            ),
            self.titleViewController.view.leadingAnchor.constraint(
                equalTo: self.anchor.leadingAnchor,
                constant: self.configuration.titleView.insets.left
            ),
            self.titleViewController.view.trailingAnchor.constraint(
                equalTo: self.anchor.trailingAnchor,
                constant: -self.configuration.titleView.insets.right
            )
        ])
        // Add ButtonViewController with Constraints
        self.add(self.buttonViewController, constraints: [
            self.buttonViewController.view.leadingAnchor.constraint(
                equalTo: self.anchor.leadingAnchor,
                constant: self.configuration.completionButton.insets.left
            ),
            self.buttonViewController.view.trailingAnchor.constraint(
                equalTo: self.anchor.trailingAnchor,
                constant: -self.configuration.completionButton.insets.right
            ),
            self.buttonViewController.view.bottomAnchor.constraint(
                equalTo: self.anchor.bottomAnchor,
                constant: -self.configuration.completionButton.insets.bottom
            )
        ])
        // Add ItemsViewController with Constraints
        self.add(self.itemsViewController, constraints: [
            self.itemsViewController.view.topAnchor.constraint(
                equalTo: self.titleViewController.view.bottomAnchor,
                constant: self.configuration.itemsView.insets.top + self.configuration.titleView.insets.bottom
            ),
            self.itemsViewController.view.leadingAnchor.constraint(
                equalTo: self.anchor.leadingAnchor,
                constant: self.configuration.itemsView.insets.left
            ),
            self.itemsViewController.view.trailingAnchor.constraint(
                equalTo: self.anchor.trailingAnchor,
                constant: -self.configuration.itemsView.insets.right
            ),
            self.itemsViewController.view.bottomAnchor.constraint(
                equalTo: self.buttonViewController.view.topAnchor,
                constant: -(self.configuration.itemsView.insets.bottom + self.configuration.completionButton.insets.top)
            )
        ])
    }
    
}

// MARK: - Handle Button Press

extension WhatsNewViewController {
    
    /// Handle Button Press
    ///
    /// - Parameter buttonType: The Button type
    func handlePress(buttonType: WhatsNewButtonViewController.ButtonType) {
        // Switch on button type
        switch buttonType {
        case .completion:
            // Invoke HapticFeebdack for completion button
            self.configuration.completionButton.hapticFeedback?.execute()
            // Store Version if VersionStore is available
            self.versionStore?.set(version: self.whatsNew.version)
            // Switch on CompletionAction
            switch self.configuration.completionButton.action {
            case .dismiss:
                // Dismiss WhatsNewViewController
                self.dismiss(animated: true)
            case .custom(action: let action):
                // Perform custom action and pass self
                action(self)
            }
        case .detail:
            // Invoke HapticFeebdack for detail button
            self.configuration.detailButton?.hapticFeedback?.execute()
            // Switch on DetailAction
            switch self.configuration.detailButton?.action {
            case .some(.website(let urlString)):
                // Check if url is available
                guard let url = URL(string: urlString) else {
                    // URL unavailable
                    return
                }
                // Initialize SafariViewController
                let safariViewController = SFSafariViewController(url: url)
                // Set tint color
                safariViewController.preferredControlTintColor = self.configuration.tintColor
                // Set Bar tint Color
                safariViewController.preferredBarTintColor = self.configuration.backgroundColor
                // Present ViewController
                self.present(safariViewController, animated: true)
            case .some(.custom(action: let action)):
                // Perform custom action and pass self
                action(self)
            case .none:
                break
            }
        }
    }
    
}

// MARK: Present/Push

public extension WhatsNewViewController {
    
    /// Present WhatsNewViewController
    ///
    /// - Parameters:
    ///   - viewController: The ViewController to present on
    ///   - animated: Should be presented animated
    ///   - completion: The completion
    func present(on viewController: UIViewController?,
                 animated: Bool = true,
                 completion: (() -> Void)? = nil) {
        // Present WhatsNewViewController
        viewController?.present(self, animated: animated, completion: completion)
    }
    
    /// Push WhatsNewViewController
    ///
    /// - Parameters:
    ///   - navigationController: The NavigationController
    ///   - animated: Should be pushed animated
    func push(on navigationController: UINavigationController?,
              animated: Bool = true) {
        // Push WhatsNewViewController
        navigationController?.pushViewController(self, animated: animated)
    }
    
}
