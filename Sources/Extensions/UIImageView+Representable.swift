import SwiftUI

// MARK: - UIImageView+Representable

extension UIImageView {
    
    /// A SwiftUI Representable UIImageView
    struct Representable: Hashable, UIViewRepresentable {
        
        // MARK: Properties
        
        /// The optional UIImage
        let image: UIImage?
        
        /// The optional tint color
        let tintColor: UIColor?
        
        // MARK: UIViewRepresentable
        
        /// Make UIImageView
        /// - Parameter context: The Context
        func makeUIView(
            context: Context
        ) -> UIImageView {
            let imageView = UIImageView(
                image: self.image
            )
            imageView.contentMode = .scaleAspectFit
            if let tintColor = self.tintColor {
                imageView.tintColor = tintColor
            }
            return imageView
        }
        
        /// Update UIImageView
        /// - Parameters:
        ///   - imageView: The UIImageView
        ///   - context: The Context
        func updateUIView(
            _ imageView: UIImageView,
            context: Context
        ) {
            imageView.image = self.image
            if let tintColor = self.tintColor {
                imageView.tintColor = tintColor
            }
        }
        
    }
    
}
