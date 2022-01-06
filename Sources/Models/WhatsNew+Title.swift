import SwiftUI

// MARK: - WhatsNew+Title

public extension WhatsNew {
    
    /// The WhatsNew Title
    struct Title: Hashable {
        
        // MARK: Properties
        
        /// The title Text
        public let text: Text
        
        /// The foreground color
        public let foregroundColor: Color
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Title`
        /// - Parameters:
        ///   - text: The title Text
        ///   - foregroundColor: The foreground color. Default value `.primary`
        public init(
            text: Text,
            foregroundColor: Color = .primary
        ) {
            self.text = text
            self.foregroundColor = foregroundColor
        }
        
    }
    
}

// MARK: - ExpressibleByStringLiteral

extension WhatsNew.Title: ExpressibleByStringLiteral {
    
    /// Creates a new instance of `WhatsNew.Title`
    /// - Parameter value: The String literal value
    public init(
        stringLiteral value: String
    ) {
        self.init(
            text: .init(value)
        )
    }
    
}
