import SwiftUI

// MARK: - VisualEffectView

#if os(macOS)
/// A NSVisualEffectView SwiftUI Representable
struct VisualEffectView: NSViewRepresentable {
    
    // MARK: Properties
    
    /// The Material. Default value `.sidebar`
    var material: NSVisualEffectView.Material = .sidebar
    
    // MARK: UIViewRepresentable
    
    /// Make NSVisualEffectView
    /// - Parameter context: The Context
    func makeNSView(
        context: Context
    ) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = self.material
        return visualEffectView
    }
    
    /// Update NSVisualEffectView
    /// - Parameters:
    ///   - visualEffectView: The NSVisualEffectView
    ///   - context: The Context
    func updateNSView(
        _ visualEffectView: NSVisualEffectView,
        context: Context
    ) {
        visualEffectView.material = self.material
    }
    
}
#else
/// A UIVisualEffect SwiftUI Representable
struct VisualEffectView: UIViewRepresentable {
    
    // MARK: Properties
    
    /// The UIVisualEffect. Default value `UIBlurEffect(style: .regular)`
    var effect: UIVisualEffect = UIBlurEffect(style: .regular)
    
    // MARK: UIViewRepresentable
    
    /// Make UIVisualEffectView
    /// - Parameter context: The Context
    func makeUIView(
        context: Context
    ) -> UIVisualEffectView {
        .init(
            effect: self.effect
        )
    }
    
    /// Update UIVisualEffectView
    /// - Parameters:
    ///   - visualEffectView: The UIVisualEffectView
    ///   - context: The Context
    func updateUIView(
        _ visualEffectView: UIVisualEffectView,
        context: Context
    ) {
        visualEffectView.effect = self.effect
    }
    
}
#endif
