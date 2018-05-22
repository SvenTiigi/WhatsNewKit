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
    
    // MARK: Typealias
    
    /// The completion typealias
    public typealias Completion = (WhatsNewViewController) -> Void
    
    // MARK: Static Properties
    
    /// The default completion which dismisses the WhatsNewViewController
    public static let defaultCompletion: Completion = {
        $0.dismiss(animated: true)
    }

    // MARK: Properties
    
    /// The WhatsNew
    private let whatsNew: WhatsNew
    
    /// The VersionStore
    private var versionStore: WhatsNewVersionStore?
    
    /// On Complete
    private let onComplete: Completion

    /// The TitleView
    private lazy var titleView: UIView = WhatsNewTitleView(
        title: self.whatsNew.title,
        backgroundColor: self.whatsNew.configuration.backgroundColor
    )
    
    /// The ItemsView
    private lazy var itemsView: UIView = WhatsNewItemsView(
        items: self.whatsNew.items,
        backgroundColor: self.whatsNew.configuration.backgroundColor
    )
    
    /// The ButtonView
    private lazy var buttonView: UIView = WhatsNewButtonView(
        detailButton: self.whatsNew.detail?.button,
        button: self.whatsNew.button,
        backgroundColor: self.whatsNew.configuration.backgroundColor,
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
    ///   - configuration: The configuration
    ///   - onComplete: The on complete closure. Default value `dismiss animated`
    public init(whatsNew: WhatsNew,
                onComplete: @escaping Completion = WhatsNewViewController.defaultCompletion) {
        // Set WhatsNew
        self.whatsNew = whatsNew
        // Set onComplete
        self.onComplete = onComplete
        // Super init
        super.init(nibName: nil, bundle: nil)
        // Set white background color
        self.view.backgroundColor = self.whatsNew.configuration.backgroundColor
        // Add Subviews
        self.view.addSubview(self.titleView)
        self.view.addSubview(self.itemsView)
        self.view.addSubview(self.buttonView)
    }
    
    /// Convenience optional initializer with WhatsNewVersionStore.
    /// Initializer checks via WhatsNewVersionStore if Version has already been presented.
    /// If a Version has been found the initializer will return nil.
    ///
    /// - Parameters:
    ///   - whatsNew: The WhatsNew
    ///   - versionStore: The WhatsNewVersionStore
    ///   - onComplete: The on complete closure. Default value `dismiss animated`
    public convenience init?(whatsNew: WhatsNew,
                             versionStore: WhatsNewVersionStore,
                             onComplete: @escaping Completion = WhatsNewViewController.defaultCompletion) {
        // Check if VersionStore has version
        if versionStore.has(version: whatsNew.version) {
            // Return nil
            return nil
        }
        // Self init with WhatsNew and onComplete closure
        self.init(whatsNew: whatsNew, onComplete: onComplete)
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
            // Store Version
            self.versionStore?.set(version: self.whatsNew.version)
            // Invoke on complete
            self.onComplete(self)
        case .detail:
            // Unwrap url
            guard let urlString = self.whatsNew.detail?.url, let url = URL(string: urlString) else {
                // URL unavailable
                return
            }
            // Initialize SafariViewController
            let safariViewController = SFSafariViewController(url: url)
            // Set tint color
            safariViewController.preferredControlTintColor = self.whatsNew.detail?.configuration.tintColor
            // Present ViewController
            self.present(safariViewController, animated: true)
        }
    }
    
}
