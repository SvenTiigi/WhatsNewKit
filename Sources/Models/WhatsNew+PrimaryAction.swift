import SwiftUI

// MARK: - WhatsNew+PrimaryAction

public extension WhatsNew {
    
    /// The WhatsNew PrimaryAction
    struct PrimaryAction {
        
        // MARK: Properties
        
        /// The title
        public let title: String
        
        /// The background color
        public let backgroundColor: Color
        
        /// The foreground color
        public let foregroundColor: Color
        
        /// The optional HapticFeedback
        public let hapticFeedback: HapticFeedback?
        
        /// The Action
        public let action: Action
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.PrimaryAction`
        /// - Parameters:
        ///   - title: The title. Default value `Continue`
        ///   - backgroundColor: The background color. Default value `.accentColor`
        ///   - foregroundColor: The foreground color. Default value `.white`
        ///   - hapticFeedback: The optional HapticFeedback. Default value `nil`
        ///   - action: The Action. Default value `.dismiss`
        public init(
            title: String = "Continue",
            backgroundColor: Color = .accentColor,
            foregroundColor: Color = .white,
            hapticFeedback: HapticFeedback? = nil,
            action: Action = .dismiss
        ) {
            self.title = title
            self.backgroundColor = backgroundColor
            self.foregroundColor = foregroundColor
            self.hapticFeedback = hapticFeedback
            self.action = action
        }
        
    }
    
}
