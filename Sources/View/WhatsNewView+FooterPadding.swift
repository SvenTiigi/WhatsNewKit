import SwiftUI

// MARK: - WhatsNewView+FooterPadding

extension WhatsNewView {
    
    /// The WhatsNewView FooterPadding ViewModifier
    struct FooterPadding {
        
        #if os(iOS) || os(visionOS)
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

extension WhatsNewView.FooterPadding: ViewModifier {
    
    /// Gets the current body of the caller.
    /// - Parameter content: The Content
    func body(
        content: Content
    ) -> some View {
        #if os(macOS)
        content.padding(.bottom, 30)
        #else
        if self.horizontalSizeClass == .regular {
            content.padding(
                .init(
                    top: 0,
                    leading: 150,
                    bottom: 50,
                    trailing: 150
                )
            )
        } else if self.verticalSizeClass == .compact {
            content.padding(
                .init(
                    top: 0,
                    leading: 40,
                    bottom: 35,
                    trailing: 40
                )
            )
        } else {
            content.padding(
                .init(
                    top: 0,
                    leading: 20,
                    bottom: 80,
                    trailing: 20
                )
            )
        }
        #endif
    }
    
}
