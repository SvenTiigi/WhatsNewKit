import SwiftUI

// MARK: - WhatsNew+PrimaryAction

public extension WhatsNew {
    
    /// The WhatsNew PrimaryAction
    struct PrimaryAction {
        
        // MARK: Properties
        
        /// The title Text
        public var title: Text
        
        /// The background color
        public var backgroundColor: Color
        
        /// The foreground color
        public var foregroundColor: Color
        
        /// The optional HapticFeedback
        public var hapticFeedback: HapticFeedback?
        
        /// The optional on dismiss closure
        public var onDismiss: (() -> Void)?
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.PrimaryAction`
        /// - Parameters:
        ///   - title: The title Text. Default value `Continue`
        ///   - backgroundColor: The background color. Default value `.accentColor`
        ///   - foregroundColor: The foreground color. Default value `.white`
        ///   - hapticFeedback: The optional HapticFeedback. Default value `nil`
        ///   - onDismiss: The optional on dismiss closure. Default value `nil`
        public init(
            title: Text = "Continue",
            backgroundColor: Color = .accentColor,
            foregroundColor: Color = .white,
            hapticFeedback: HapticFeedback? = nil,
            onDismiss: (() -> Void)? = nil
        ) {
            self.title = title
            self.backgroundColor = backgroundColor
            self.foregroundColor = foregroundColor
            self.hapticFeedback = hapticFeedback
            self.onDismiss = onDismiss
        }
        
    }
    
}
