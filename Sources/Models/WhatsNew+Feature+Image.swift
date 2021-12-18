import SwiftUI

// MARK: - WhatsNew+Item+Image

public extension WhatsNew.Feature {
    
    /// A WhatsNew Feature Image
    struct Image {
        
        // MARK: Properties
        
        /// The Image View
        public let view: AnyView
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Feature.Image`
        /// - Parameters:
        ///   - image: A ViewBuilder closure that produces an Image View
        public init<Image: View>(
            @ViewBuilder
            image: () -> Image
        ) {
            self.view = .init(image())
        }
        
    }

}

// MARK: - Image+init(image:)

public extension WhatsNew.Feature.Image {
    
    /// Creates a new instance of `WhatsNew.Feature.Image`
    /// - Parameter image: The Image
    init(
        image: Image
    ) {
        self.init { image }
    }
    
}

// MARK: - Image+init(name:)

public extension WhatsNew.Feature.Image {
    
    /// Creates a new instance of `WhatsNew.Feature.Image`
    /// - Parameters:
    ///   - name: The name of the image resource to lookup
    ///   - bundle: The bundle to search for the image resource. Default value `.main`
    ///   - renderingMode: The mode SwiftUI uses to render images. Default value `.template`
    ///   - foregroundColor: The foreground color to use when displaying this view. Default value `.accentColor`
    init(
        name: String,
        bundle: Bundle = .main,
        renderingMode: Image.TemplateRenderingMode? = .template,
        foregroundColor: Color? = .accentColor
    ) {
        self.init {
            Image(
                name,
                bundle: bundle
            )
            .renderingMode(renderingMode)
            .font(.title)
            .imageScale(.large)
            .foregroundColor(foregroundColor)
        }
    }
    
}

// MARK: - Image+init(systemName:)

public extension WhatsNew.Feature.Image {
    
    /// Creates a new instance of `WhatsNew.Feature.Image`
    /// - Parameters:
    ///   - systemName: The name of the system symbol image
    ///   - renderingMode: The mode SwiftUI uses to render images. Default value `.template`
    ///   - foregroundColor: The foreground color to use when displaying this view. Default value `.accentColor`
    init(
        systemName: String,
        renderingMode: Image.TemplateRenderingMode? = .template,
        foregroundColor: Color? = .accentColor
    ) {
        self.init {
            Image(
                systemName: systemName
            )
            .renderingMode(renderingMode)
            .font(.title)
            .imageScale(.large)
            .foregroundColor(foregroundColor)
        }
    }
    
    /// Creates a new instance of `WhatsNew.Feature.Image`
    /// - Parameters:
    ///   - systemName: The name of the system symbol image
    ///   - renderingMode: The mode SwiftUI uses to render images. Default value `.template`
    ///   - symboldRenderingMode: The symbol rendering mode to use
    ///   - foregroundColor: The foreground color to use when displaying this view. Default value `.accentColor`
    @available(iOS 15.0, tvOS 15.0, macOS 12.0, *)
    init(
        systemName: String,
        renderingMode: Image.TemplateRenderingMode? = .template,
        symboldRenderingMode: SymbolRenderingMode?,
        foregroundColor: Color? = .accentColor
    ) {
        self.init {
            Image(
                systemName: systemName
            )
            .renderingMode(renderingMode)
            .symbolRenderingMode(symboldRenderingMode)
            .font(.title)
            .imageScale(.large)
            .foregroundColor(foregroundColor)
        }
    }
    
}
