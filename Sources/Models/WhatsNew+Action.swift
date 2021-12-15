import UIKit
import SafariServices

// MARK: - WhatsNew+Action

public extension WhatsNew {
    
    /// A WhatsNew Action
    struct Action {
        
        // MARK: Typealias
        
        /// The Action typealias
        public typealias Action = (DismissAction) -> Void
        
        // MARK: Properties
        
        /// The Action closure
        private let action: Action
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Action`
        /// - Parameter action: The Action closure
        public init(
            action: @escaping Action
        ) {
            self.action = action
        }
        
        // MARK: Call as Function
        
        /// Call WhatsNew Action as function
        /// - Parameter dismissAction: The DismissAction
        public func callAsFunction(
            dismissAction: DismissAction
        ) {
            self.action(dismissAction)
        }
        
    }
    
}

// MARK: - Action+defaults

public extension WhatsNew.Action {
    
    /// A Action that dismisses the currently presented WhatsNew Sheet
    static let dismiss = Self { $0() }
    
    /// Open URL in a SafariViewController Action
    /// - Parameters:
    ///   - url: The URL that should be opened
    ///   - application: The UIApplication used to presented the SafariViewController. Default value `.shared`
    static func open(
        url: URL?,
        application: UIApplication = .shared
    ) -> Self {
        .init { _ in
            // Verify a URL is available
            guard let url = url else {
                // Otherwise return out of function
                return
            }
            // Initialize SafariViewController
            let safariViewController = SFSafariViewController(url: url)
            // Present SafariViewController
            application
                .windows
                .first { $0.isKeyWindow }?
                .rootViewController?
                .presentedViewController?
                .present(safariViewController, animated: true)
        }
    }
    
}

// MARK: - Action+DimissAction

public extension WhatsNew.Action {
    
    /// The DismissAction
    struct DismissAction {
        
        // MARK: Typealias
        
        /// The Dismiss typealias
        public typealias Dismiss = () -> Void
        
        // MARK: Properties
        
        /// The Dismiss closure
        private let dismiss: Dismiss
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Action.DismissAction`
        /// - Parameter dismiss: The Dismiss closure
        public init(
            dismiss: @escaping Dismiss
        ) {
            self.dismiss = dismiss
        }
        
        // MARK: Call as Function
        
        /// Call DismissAction as function
        public func callAsFunction() {
            self.dismiss()
        }
        
    }
    
}
