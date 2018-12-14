//
//  WhatsNewViewController.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import SafariServices
import UIKit

/// The WhatsNewViewController
public class WhatsNewViewController: UIViewController {
    
    // MARK: Public Properties
    
    /// The preferred status bar style
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.view.backgroundColor?.isLight == true ? .default : .lightContent
    }
    
    /// The WhatsNew
    public let whatsNew: WhatsNew
    
    // MARK: Private Properties
    
    /// The Configuration
    private var configuration: Configuration
    
    /// The VersionStore
    private var versionStore: WhatsNewVersionStore?
    
    // MARK: ThemableViews

    /// The TitleView
    private lazy var titleView: UIView = WhatsNewTitleView(
        title: self.whatsNew.title,
        configuration: self.configuration
    )
    
    /// The ItemsView
    private lazy var itemsView: UIView = WhatsNewItemsView(
        items: self.whatsNew.items,
        configuration: self.configuration
    )
    
    /// The ButtonsView
    private lazy var buttonsView: UIView = WhatsNewButtonsView(
        configuration: self.configuration,
        onPress: { [weak self] buttonType in
            // Handle button type
            self?.handleOnPress(buttonType: buttonType)
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
        // Add TitleView
        self.view.addSubview(self.titleView)
        // Add ItemsView
        self.view.addSubview(self.itemsView)
        // Add ButtonView
        self.view.addSubview(self.buttonsView)
    }
    
    /// View did layout subviews
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Set TitleView frame (20% height)
        self.titleView.frame = CGRect(
            x: 0,
            y: 0,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height * 0.2
        )
        // Set ItemsView frame (60% height)
        self.itemsView.frame = CGRect(
            x: 0,
            y: self.titleView.frame.size.height,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height * 0.6
        )
        // Set ButtonView frame (20% height)
        self.buttonsView.frame = CGRect(
            x: 0,
            y: self.view.frame.size.height - self.view.frame.size.height * 0.2,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height * 0.2
        )
    }
    
    // MARK: Action Handler
    
    /// Handle onPress with button type
    ///
    /// - Parameter buttonType: The Button type
    func handleOnPress(buttonType: WhatsNewButtonsView.ButtonType) {
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

// MARK: Present - Push API

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
