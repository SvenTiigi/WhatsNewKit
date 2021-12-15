import SwiftUI

// MARK: - WhatsNew+SecondaryAction

public extension WhatsNew {
    
    /// The WhatsNew SecondaryAction
    struct SecondaryAction {
        
        // MARK: Properties
        
        /// The title Text
        public let title: Text
        
        /// The foreground color
        public let foregroundColor: Color
        
        /// The optional HapticFeedback
        public let hapticFeedback: HapticFeedback?
        
        /// The Action
        public let action: Action
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.PrimaryAction`
        /// - Parameters:
        ///   - title: The title Text
        ///   - foregroundColor: The foreground color. Default value `.accentColor`
        ///   - hapticFeedback: The optional HapticFeedback. Default value `nil`
        ///   - action: The Action
        public init(
            title: Text,
            foregroundColor: Color = .accentColor,
            hapticFeedback: HapticFeedback? = nil,
            action: WhatsNew.Action
        ) {
            self.title = title
            self.foregroundColor = foregroundColor
            self.hapticFeedback = hapticFeedback
            self.action = action
        }
        
    }
    
}
