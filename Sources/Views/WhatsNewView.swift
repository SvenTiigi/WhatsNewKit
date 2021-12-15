import SwiftUI

// MARK: - WhatsNewView

/// A WhatsNewView
public struct WhatsNewView {
    
    // MARK: Properties
    
    /// The WhatsNew object
    private let whatsNew: WhatsNew
    
    /// The WhatsNewVersionStore
    private let whatsNewVersionStore: WhatsNewVersionStore?
    
    /// The PresentationMode
    @Environment(\.presentationMode)
    private var presentationMode
    
    // MARK: Initializer
    
    /// Creates a new instance of `WhatsNewView`
    /// - Parameters:
    ///   - whatsNew: The WhatsNew object
    ///   - versionStore: The optional WhatsNewVersionStore. Default value `nil`
    public init(
        whatsNew: WhatsNew,
        versionStore: WhatsNewVersionStore? = nil
    ) {
        self.whatsNew = whatsNew
        self.whatsNewVersionStore = versionStore
    }
    
}

public extension WhatsNewView {
    
    struct Layout {

        
        public init(
            showsScrollViewIndicators: Bool = false,
            contentSpacing: CGFloat = 57,
            contentTopPadding: CGFloat = 62,
            featureSpacing: CGFloat = 26,
            featureLeadingPadding: CGFloat = 14
        ) {
            
        }
        
    }
    
}

// MARK: - View

extension WhatsNewView: View {
    
    /// The content and behavior of the view.
    public var body: some View {
        ZStack {
            // Content
            ScrollView(
                .vertical,
                showsIndicators: false
            ) {
                VStack(
                    spacing: 57
                ) {
                    self.title
                    VStack(
                        alignment: .leading,
                        spacing: 26
                    ) {
                        ForEach(
                            self.whatsNew.features,
                            id: \.self,
                            content: Feature.init
                        )
                    }
                    .adapativePadding(.features)
                    .padding(.leading, 14)
                }
                .padding(.horizontal)
                .padding(.top, 62)
                // ScrollView bottom content inset
                Color.clear.padding(.bottom, 150)
            }
            // Footer
            VStack {
                Spacer()
                Footer(
                    primaryAction: self.whatsNew.primaryAction,
                    secondaryAction: self.whatsNew.secondaryAction,
                    presentationMode: self.presentationMode
                )
                .adapativePadding(.footer)
                .background(
                    UIVisualEffectView
                        .Representable()
                        .edgesIgnoringSafeArea(.horizontal)
                        .padding(.top, -10)
                )
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .onDisappear {
            // Set Version in WhatsNewVersionStore, if available
            self.whatsNewVersionStore?.set(
                version: self.whatsNew.version
            )
        }
    }
    
}

private extension WhatsNewView {
    
    var title: some View {
        Group {
            if #available(iOS 15, *) {
                Text(
                    AttributedString(self.whatsNew.title.text)
                )
            } else {
                Text(
                    verbatim: self.whatsNew.title.text.string
                )
            }
        }
        .font(.largeTitle.bold())
        .multilineTextAlignment(.center)
    }
    
}

private extension WhatsNewView {
    
    func feature(_ feature: WhatsNew.Feature) -> some View {
        EmptyView()
    }
    
}
