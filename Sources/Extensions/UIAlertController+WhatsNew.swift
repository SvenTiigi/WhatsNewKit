//
//  UIAlertController+WhatsNew.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 23.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    // MARK: Typealias
    
    /// Item to Text typealias
    typealias ItemToText = (WhatsNew.Item) -> String
    
    // MARK: Static Properties
    
    /// The default ItemToText closure
    static let defaultItemToText: ItemToText = {
        "• \($0.title): \($0.text)"
    }
    
    // MARK: Initializer
    
    /// Convenience initializer with WhatsNew and onComplete closure
    ///
    /// - Parameters:
    ///   - whatsNew: The WhatsNew object
    ///   - itemToText: The optional custom conversion from item to text. Default value `"• \($0.title): \($0.text)"`
    ///   - onComplete: The optional onComplete closure
    convenience init(whatsNew: WhatsNew,
                     itemToText: ItemToText = UIAlertController.defaultItemToText,
                     onComplete: (() -> Void)? = nil) {
        // Initialize Message
        let message = whatsNew.items.map(itemToText).joined(separator: "\n")
        // Self init with title and message as alert type
        self.init(title: whatsNew.title, message: message, preferredStyle: .alert)
        // Add Completion Action
        self.addAction(.init(title: whatsNew.completionButtonTitle, style: .cancel, handler: { _ in
            // Invoke onComplete
            onComplete?()
        }))
    }
    
    /// Optional convenience initializer with WhatsNew and WhatsNewVersionStore.
    /// Checks if WhatsNewVersionStore has Version. If so initializer will return nil
    /// as this Version has been already been presented. If Version is unavailable initializer
    /// will return initialized UIAlertController and will save Version after completion
    ///
    /// - Parameters:
    ///   - whatsNew: The WhatsNew Object
    ///   - versionStore: The WhatsNewVersionStore
    ///   - itemToText: The optional custom conversion from item to text. Default value `"• \($0.title): \($0.text)"`
    ///   - onComplete: The optional onComplete closure
    convenience init?(whatsNew: WhatsNew,
                      versionStore: WhatsNewVersionStore,
                      itemToText: ItemToText = UIAlertController.defaultItemToText,
                      onComplete: (() -> Void)? = nil) {
        // Check if VersionStore has Version
        if versionStore.has(version: whatsNew.version) {
            // Return nil as Version has been already presented
            return nil
        }
        // Self init with WhatsNew, itemToText and onComplete
        self.init(whatsNew: whatsNew, itemToText: itemToText, onComplete: {
            // Set version
            versionStore.set(version: whatsNew.version)
            // Invoke onComplete
            onComplete?()
        })
    }
    
}
