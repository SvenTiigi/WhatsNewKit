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
        var white: CGFloat = 0
        self.view.backgroundColor?.getWhite(&white, alpha: nil)
        return white > 0.5 ? .default : .lightContent
    }
    
    // MARK: Private Properties
    
    /// The WhatsNew
    private let whatsNew: WhatsNew
    
    /// The Configuration
    private var configuration: Configuration
    
    /// The VersionStore
    private var versionStore: WhatsNewVersionStore?
    
    // MARK: ThemableViews

    /// The TitleView
    private lazy var titleView: ThemableView = WhatsNewTitleView(
        title: self.whatsNew.title,
        theme: self.configuration.theme
    )
    
    /// The ItemsView
    private lazy var itemsView: ThemableView = WhatsNewItemsView(
        items: self.whatsNew.items,
        theme: self.configuration.theme
    )
    
    /// The ButtonView
    private lazy var buttonView: ThemableView = WhatsNewButtonView(
        completionButtonTitle: self.configuration.completionButton.title,
        detailButtonTitle: self.configuration.detailButton?.title,
        theme: self.configuration.theme,
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
                configuration: Configuration) {
        // Set WhatsNew
        self.whatsNew = whatsNew
        // Set Configuration
        self.configuration = configuration
        // Super init
        super.init(nibName: nil, bundle: nil)
        // Set background color
        self.view.backgroundColor = self.configuration.theme.backgroundColor
        // Add TitleView
        self.view.addSubview(self.titleView)
        // Add ItemsView
        self.view.addSubview(self.itemsView)
        // Add ButtonView
        self.view.addSubview(self.buttonView)
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
                             configuration: Configuration,
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
    
    /// View did layout subviews
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Set TitleView frame
        self.titleView.frame = CGRect(
            x: 0,
            y: 0,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height * 0.2
        )
        // Set ItemsView frame
        self.itemsView.frame = CGRect(
            x: 0,
            y: self.titleView.frame.size.height,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height * 0.6
        )
        // Set ButtonView frame
        self.buttonView.frame = CGRect(
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
    private func handleOnPress(buttonType: WhatsNewButtonView.ButtonType) {
        // Switch on button type
        switch buttonType {
        case .completion:
            // Store Version if VersionStore is available
            self.versionStore?.set(version: self.whatsNew.version)
            // Switch on CompletionAction
            switch self.configuration.completionButton.action {
            case .dismiss:
                self.dismiss(animated: true)
            case .custom(action: let action):
                action(self)
            }
        case .detail:
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
                safariViewController.preferredControlTintColor = self.configuration.theme.tintColor
                // Present ViewController
                self.present(safariViewController, animated: true)
            case .some(.custom(action: let action)):
                action(self)
            case .none:
                break
            }
        }
    }
    
}
