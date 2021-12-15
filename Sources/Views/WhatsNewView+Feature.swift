import SwiftUI

// MARK: - WhatsNewView+Feature

extension WhatsNewView {
    
    /// The WhatsNewView Feature component
    struct Feature {
        
        /// The WhatsNew Feature
        let feature: WhatsNew.Feature
        
    }
    
}

// MARK: - View

extension WhatsNewView.Feature: View {
    
    /// The content and behavior of the view.
    var body: some View {
        HStack(
            spacing: 15
        ) {
            ImageView(
                image: self.feature.image
            )
            .frame(width: 40)
            VStack(
                alignment: .leading,
                spacing: 2
            ) {
                Text(
                    verbatim: self.feature.title
                )
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.primary)
                Text(
                    verbatim: self.feature.subtitle
                )
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.leading)
        }
    }
    
}

// MARK: - ImageView

private extension WhatsNewView.Feature {
    
    /// A WhatsNewView Feature ImageView
    struct ImageView: UIViewRepresentable {
        
        // MARK: Properties
        
        /// The WhatsNew Feature Image
        let image: WhatsNew.Feature.Image
        
        // MARK: UIViewRepresentable
        
        /// Make UIImageView
        /// - Parameter context: The Context
        func makeUIView(
            context: Context
        ) -> UIImageView {
            let imageView = UIImageView(
                image: self.image.uiImage
            )
            imageView.contentMode = .scaleAspectFit
            if let tintColor = self.image.tintColor {
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
            imageView.image = self.image.uiImage
            if let tintColor = self.image.tintColor {
                imageView.tintColor = tintColor
            }
        }
        
    }
    
}
