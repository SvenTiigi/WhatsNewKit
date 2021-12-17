import SwiftUI

// MARK: - AdaptivePaddingTarget

/// An AdaptivePaddingTarget
enum AdaptivePaddingTarget: String, Codable, Hashable, CaseIterable {
    /// Features
    case features
    /// Footer
    case footer
}

// MARK: - View+adapativePadding

extension View {
    
    /// Apply adaptive Padding to this View for a given target
    /// - Parameter target: The AdaptivePaddingTarget
    func adapativePadding(
        _ target: AdaptivePaddingTarget
    ) -> some View {
        self.modifier(
            AdapativePaddingViewModifier(
                target: target
            )
        )
    }
    
}

// MARK: - AdapativePaddingViewModifier

/// The AdapativePaddingViewModifier
private struct AdapativePaddingViewModifier: ViewModifier {
    
    // MARK: Properties
    
    /// The AdaptivePaddingTarget
    let target: AdaptivePaddingTarget
    
    /// The Horizontal SizeClass
    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass
    
    /// The Vertical SizeClass
    @Environment(\.verticalSizeClass)
    private var verticalSizeClass
    
    // MARK: ViewModifier
    
    /// Gets the current body of the caller.
    /// - Parameter content: The Content
    func body(
        content: Content
    ) -> some View {
        // Check if horizontal size class is regular (iPad)
        if self.horizontalSizeClass == .regular {
            // Switch on AdaptivePaddingTarget
            switch self.target {
            case .features:
                content.padding(
                    .init(
                        top: 0,
                        leading: 100,
                        bottom: 0,
                        trailing: 100
                    )
                )
            case .footer:
                content.padding(
                    .init(
                        top: 0,
                        leading: 150,
                        bottom: 50,
                        trailing: 150
                    )
                )
            }
        } else {
            // Switch on AdaptivePaddingTarget
            switch self.target {
            case .features:
                // Apply no padding
                content
            case .footer:
                // Check if vertical size class is compact (landscape)
                if self.verticalSizeClass == .compact {
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
            }
        }
    }
    
}
