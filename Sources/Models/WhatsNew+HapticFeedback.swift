import Foundation
#if os(iOS)
import UIKit
#endif

// MARK: - WhatsNew+HapticFeedback

public extension WhatsNew {
    
    /// The WhatsNew HapticFeedback
    enum HapticFeedback: Hashable {
        #if os(iOS) && !os(visionOS)
        /// Impact HapticFeedback
        case impact(
            style: UIImpactFeedbackGenerator.FeedbackStyle? = nil,
            intensity: CGFloat? = nil
        )
        /// Selection HapticFeedback
        case selection
        /// Notification HapticFeedback
        case notification(
            UINotificationFeedbackGenerator.FeedbackType = .success
        )
        #endif
    }
    
}

// MARK: - Call-as-Function

public extension WhatsNew.HapticFeedback {
    
    /// Call HapticFeedback as function to execute the HapticFeedback
    func callAsFunction() {
        #if os(iOS) && !os(visionOS)
        switch self {
        case .impact(let style, let intensity):
            let feedbackGenerator = style.flatMap(UIImpactFeedbackGenerator.init) ?? .init()
            if let intensity = intensity {
                feedbackGenerator.impactOccurred(intensity: intensity)
            } else {
                feedbackGenerator.impactOccurred()
            }
        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()
        case .notification(let type):
            UINotificationFeedbackGenerator().notificationOccurred(type)
        }
        #endif
    }
    
}
