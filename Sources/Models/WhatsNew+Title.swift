import SwiftUI

// MARK: - WhatsNew+Title

public extension WhatsNew {
    
    /// The WhatsNew Title
    struct Title: Hashable {
        
        // MARK: Properties
        
        /// The title text
        public let text: NSAttributedString
        
        /// The foreground color
        public let foregroundColor: Color
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Title`
        /// - Parameters:
        ///   - text: The title text NSAttributedString
        ///   - foregroundColor: The foreground color. Default value `.primary`
        @available(iOS 15, *)
        public init(
            text: NSAttributedString,
            foregroundColor: Color = .primary
        ) {
            self.text = text
            self.foregroundColor = foregroundColor
        }
        
    }
    
}

// MARK: - Initializer with AttributedString

@available(iOS 15, *)
public extension WhatsNew.Title {
    
    /// Creates a new instance of `WhatsNew.Title`
    /// - Parameters:
    ///   - text: The title text AttributedString
    ///   - foregroundColor: The foreground color. Default value `.primary`
    init(
        text: AttributedString,
        foregroundColor: Color = .primary
    ) {
        self.text = .init(text)
        self.foregroundColor = foregroundColor
    }
    
}

// MARK: - Initializer with String

public extension WhatsNew.Title {
    
    /// Creates a new instance of `WhatsNew.Title`
    /// - Parameters:
    ///   - text: The title text String
    ///   - foregroundColor: The foreground color. Default value `.primary`
    init(
        text: String,
        foregroundColor: Color = .primary
    ) {
        self.text = .init(string: text)
        self.foregroundColor = foregroundColor
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
            text: value
        )
    }
    
}
