import SwiftUI

// MARK: - SecondaryAction+Action

public extension WhatsNew.SecondaryAction {
    
    /// A WhatsNew Secondary Action
    enum Action {
        /// Present View
        case present(AnyView)
        /// Custom Action
        case custom((Binding<PresentationMode>) -> Void)
    }
    
}

// MARK: - Action+present

public extension WhatsNew.SecondaryAction.Action {
    
    /// Present View on WhatsNewView
    /// - Parameters:
    ///   - content: The ViewBuilder closure that produces the Content View
    static func present<Content: View>(
        @ViewBuilder
        _ content: () -> Content
    ) -> Self {
        .present(.init(content()))
    }
    
}

// MARK: - Action+dismiss

public extension WhatsNew.SecondaryAction.Action {
    
    /// Dismiss WhatsNewView
    static let dismiss: Self = .custom { presentationMode in
        presentationMode.wrappedValue.dismiss()
    }
    
}

// MARK: - Action+openURL

public extension WhatsNew.SecondaryAction.Action {
    
    /// Open a URL
    /// - Parameters:
    ///   - url: The URL that should be opened
    ///   - application: The UIApplication used to open the URL. Default value `.shared`
    static func openURL(
        _ url: URL?
    ) -> Self {
        .custom { _ in
            // Verify URL is available
            guard let url = url else {
                // Otherwise return out of function
                return
            }
            // Open URL
            #if os(macOS)
            NSWorkspace.shared.open(
                url
            )
            #else
            UIApplication.shared.open(
                url,
                options: .init()
            )
            #endif
        }
    }
    
}

// MARK: - Action+PresentedView

extension WhatsNew.SecondaryAction.Action {
    
    /// The WhatsNew Secondary Action PresentedView
    struct PresentedView: Identifiable {
        
        /// The identifier
        var id: UUID = .init()
        
        /// The View
        let view: AnyView
        
    }
    
}
