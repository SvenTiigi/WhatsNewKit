import SwiftUI

// MARK: - ScrollView+alwaysBounceVertical

extension ScrollView {
    
    /// Resolve the underlying `UIScrollView` to update the `alwaysBounceVertical` attribute which is
    /// a Boolean value that determines whether bouncing always occurs when vertical scrolling reaches the end of the content.
    /// - Parameter alwaysBounceVertical: Bool value if the UIScrollView should always bounce vertical
    func alwaysBounceVertical(
        _ alwaysBounceVertical: Bool
    ) -> some View {
        self.overlay(
            ViewControllerResolver { viewController in
                // Verify UIScrollView is available
                guard let scrollView = viewController
                        .view
                        .subviews
                        .first(where: { $0 is UIScrollView }) as? UIScrollView else {
                    // Otherwise return out of function
                    return
                }
                // Set alwaysBounceVertical
                scrollView.alwaysBounceVertical = alwaysBounceVertical
            }
            .frame(width: 0, height: 0)
        )
    }
    
}

// MARK: - ViewControllerResolver

/// The ViewControllerResolver
private struct ViewControllerResolver: UIViewControllerRepresentable {
    
    // MARK: Typealias
    
    /// A typealias represents a UIViewController resolver closure
    typealias Resolver = (UIViewController) -> Void
    
    // MARK: Properties
    
    /// The Resolver
    let resolver: Resolver
    
    // MARK: UIViewControllerRepresentable
    
    /// Make ResolvedViewController
    /// - Parameter context: The Context
    func makeUIViewController(
        context: Context
    ) -> Content {
        .init(resolver: self.resolver)
    }
    
    /// Update ResolvedViewController
    /// - Parameters:
    ///   - uiViewController: The ResolvedViewController
    ///   - context: The Context
    func updateUIViewController(
        _ content: Content,
        context: Context
    ) {
        content.resolver = self.resolver
    }
    
}

// MARK: - ViewControllerResolver+Content

private extension ViewControllerResolver {
    
    /// The ViewControllerResolver Content
    final class Content: UIViewController {
        
        // MARK: Properties
        
        /// The Resolver
        var resolver: Resolver
        
        // MARK: Initializer
        
        /// Creates a new instance of `ViewControllerResolver.Content`
        /// - Parameter onResolve: The Resolver
        init(
            resolver: @escaping Resolver
        ) {
            self.resolver = resolver
            super.init(nibName: nil, bundle: nil)
        }
        
        /// Initializer with NSCoder is unavailable
        @available(*, unavailable)
        required init?(
            coder aDecoder: NSCoder
        ) { nil }
        
        // MARK: View-Lifecycle
        
        /// Did move to parent ViewController
        /// - Parameter parent: The parent ViewController
        override func didMove(
            toParent parent: UIViewController?
        ) {
            super.didMove(toParent: parent)
            parent.flatMap(self.resolver)
        }
    }
    
}
