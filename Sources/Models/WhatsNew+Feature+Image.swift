import UIKit

// MARK: - WhatsNew+Item+Image

public extension WhatsNew.Feature {
    
    /// A WhatsNew Feature Image
    struct Image: Hashable {
        
        // MARK: Properties
        
        /// The UIImage
        public let uiImage: UIImage?
        
        /// The optional tint color
        public let tintColor: UIColor?
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Feature.Image`
        /// - Parameters:
        ///   - uiImage: The UIImage
        ///   - tintColor: The optional tint color. Default value `nil`
        public init(
            uiImage: UIImage?,
            tintColor: UIColor? = nil
        ) {
            self.uiImage = uiImage
            self.tintColor = tintColor
        }
        
    }

}

// MARK: - Image+init(systemName:)

public extension WhatsNew.Feature.Image {
    
    /// Creates a new instance of `WhatsNew.Feature.Image`
    /// - Parameters:
    ///   - systemName: The system image name
    ///   - symbolConfiguration: The system image SymbolConfiguration
    ///   - tintColor: The optional tint color. Default value `nil`
    init(
        systemName: String,
        symbolConfiguration: UIImage.SymbolConfiguration,
        tintColor: UIColor? = nil
    ) {
        self.init(
            uiImage: UIImage(
                systemName: systemName,
                withConfiguration: symbolConfiguration
            ),
            tintColor: tintColor
        )
    }
    
    /// Creates a new instance of `WhatsNew.Feature.Image`
    /// - Parameters:
    ///   - systemName: The system image name
    ///   - tintColor: The optional tint color. Default value `nil`
    init(
        systemName: String,
        tintColor: UIColor? = nil
    ) {
        self.init(
            systemName: systemName,
            symbolConfiguration: .init(
                textStyle: .title1,
                scale: .large
            ),
            tintColor: tintColor
        )
    }
    
}

// MARK: - Image+init(named:)

public extension WhatsNew.Feature.Image {
    
    /// Creates a new instance of `WhatsNew.Feature.Image`
    /// - Parameters:
    ///   - name: The name of the image asset or file
    ///   - tintColor: The optional tint color. Default value `nil`
    init(
        named name: String,
        tintColor: UIColor? = nil
    ) {
        self.init(
            uiImage: .init(named: name),
            tintColor: tintColor
        )
    }
    
}
