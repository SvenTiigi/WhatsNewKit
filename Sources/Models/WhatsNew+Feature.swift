import SwiftUI

// MARK: - WhatsNew+Item

public extension WhatsNew {
    
    /// A WhatsNew Feature
    struct Feature: Hashable {
        
        // MARK: Properties
        
        /// The image
        public let image: Image
        
        /// The title Text
        public let title: Text
        
        /// The subtitle Text
        public let subtitle: Text
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Feature`
        /// - Parameters:
        ///   - image: The image
        ///   - title: The title Text
        ///   - subtitle: The subtitle Text
        public init(
            image: Image,
            title: Text,
            subtitle: Text
        ) {
            self.image = image
            self.title = title
            self.subtitle = subtitle
        }
        
    }
    
}
