import SwiftUI

// MARK: - WhatsNewView+FeaturesPadding

extension WhatsNewView {
    
    /// The WhatsNewView FeaturesPadding ViewModifier
    struct FeaturesPadding {
        
        #if os(iOS)
        /// The Horizontal SizeClass
        @Environment(\.horizontalSizeClass)
        private var horizontalSizeClass

        /// The Vertical SizeClass
        @Environment(\.verticalSizeClass)
        private var verticalSizeClass
        #endif
        
    }
    
}

// MARK: - ViewModifier

extension WhatsNewView.FeaturesPadding: ViewModifier {
    
    /// Gets the current body of the caller.
    /// - Parameter content: The Content
    func body(
        content: Content
    ) -> some View {
        #if os(macOS)
        content.padding(.horizontal)
        #else
        if self.horizontalSizeClass == .regular {
            content.padding(
                .init(
                    top: 0,
                    leading: 100,
                    bottom: 0,
                    trailing: 100
                )
            )
        } else {
            content
        }
        #endif
    }
    
}
