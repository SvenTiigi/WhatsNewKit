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

    // MARK: Properties
    
    /// The WhatsNew
    private let whatsNew: WhatsNew
    
    /// On Complete
    private let onComplete: (WhatsNewViewController) -> Void

    /// The TitleView
    private lazy var titleView: UIView = WhatsNewTitleView(
        title: self.whatsNew.title
    )
    
    /// The ItemsView
    private lazy var itemsView: UIView = WhatsNewItemsView(
        items: self.whatsNew.items
    )
    
    /// The ButtonView
    private lazy var buttonView: UIView = WhatsNewButtonView(
        detailButton: self.whatsNew.detail?.button,
        button: self.whatsNew.button,
        onPress: { [weak self] action in
            // Handle action
            self?.handle(action: action)
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
                onComplete: @escaping (WhatsNewViewController) -> Void = { $0.dismiss(animated: true) }) {
        // Set WhatsNew
        self.whatsNew = whatsNew
        // Set onComplete
        self.onComplete = onComplete
        // Super init
        super.init(nibName: nil, bundle: nil)
        // Set white background color
        self.view.backgroundColor = .white
        // Add Subviews
        self.view.addSubview(self.titleView)
        self.view.addSubview(self.itemsView)
        self.view.addSubview(self.buttonView)
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
    
    /// Handle Action
    ///
    /// - Parameter action: The Action
    private func handle(action: WhatsNewButtonView.Action) {
        // Switch on action
        switch action {
        case .completion:
            // Store Version
            WhatsNewViewController.store.set(version: self.whatsNew.version)
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

// MARK: - Static Information

public extension WhatsNewViewController {
    
    /// The Store
    private static let store = WhatsNewStore()
    
    // MARK: Static Function
    
    /// Should present WhatsNew
    ///
    /// - Parameter whatsNew: The WhatsNew object
    /// - Returns: Bool if WhatsNew has already been presented
    static func shouldPresent(whatsNew: WhatsNew) -> Bool {
        return self.store.has(version: whatsNew.version)
    }
    
    /// Should present WhatsNew for Version
    ///
    /// - Parameter version: The Version
    /// - Returns: Bool if WhatsNew for Version has already been presented
    static func shouldPresent(version: String) -> Bool {
        return self.store.has(version: version)
    }
    
    /// Clear all presented WhatsNews
    static func clearAllPresentedWhatsNew() {
        self.store.clear()
    }
    
}
