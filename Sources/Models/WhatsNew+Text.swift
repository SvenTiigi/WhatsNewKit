import SwiftUI

// MARK: - WhatsNew+Text

public extension WhatsNew {
    
    /// A WhatsNew Text
    struct Text: Hashable {
        
        // MARK: Properties
        
        /// The NSAttributedString
        public let attributedString: NSAttributedString

        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Text` from a given String
        /// - Parameter string: The String
        public init(
            _ string: String
        ) {
            self.attributedString = .init(string: string)
        }
        
    }
    
}

// MARK: - AttributedString Initializer

@available(iOS 15.0, tvOS 15.0, macOS 12.0, *)
public extension WhatsNew.Text {
    
    /// Creates a new instance of `WhatsNew.Text` from a given NSAttributedString
    /// - Parameter attributedString: The NSAttributedString
    init(
        _ attributedString: NSAttributedString
    ) {
        self.attributedString = attributedString
    }
    
    /// Creates a new instance of `WhatsNew.Text` from a given AttributedString
    /// - Parameter attributedString: The AttributedString
    init(
        _ attributedString: AttributedString
    ) {
        self.attributedString = .init(attributedString)
    }
    
}

// MARK: - ExpressibleByStringLiteral

extension WhatsNew.Text: ExpressibleByStringLiteral {
    
    /// Creates a new instance of `WhatsNew.Text` from a given String literal
    /// - Parameter value: The String literal
    public init(
        stringLiteral value: String
    ) {
        self.init(value)
    }
    
}
