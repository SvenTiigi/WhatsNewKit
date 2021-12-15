import UIKit

// MARK: - WhatsNew+Item

public extension WhatsNew {
    
    /// A WhatsNew Feature
    struct Feature: Hashable {
        
        // MARK: Properties
        
        /// The image
        public let image: Image
        
        /// The title
        public let title: String
        
        /// The subtitle
        public let subtitle: String
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Feature`
        /// - Parameters:
        ///   - image: The image
        ///   - title: The title
        ///   - subtitle: The subtitle
        public init(
            image: Image,
            title: String,
            subtitle: String
        ) {
            self.image = image
            self.title = title
            self.subtitle = subtitle
        }
        
    }
    
}
