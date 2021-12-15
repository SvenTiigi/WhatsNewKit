import SwiftUI

// MARK: - WhatsNewView

/// A WhatsNewView
public struct WhatsNewView {
    
    // MARK: Properties
    
    /// The WhatsNew object
    private let whatsNew: WhatsNew
    
    /// The WhatsNewVersionStore
    private let whatsNewVersionStore: WhatsNewVersionStore?
    
    /// The Layout
    private let layout: Layout
    
    /// The PresentationMode
    @Environment(\.presentationMode)
    private var presentationMode
    
    // MARK: Initializer
    
    /// Creates a new instance of `WhatsNewView`
    /// - Parameters:
    ///   - whatsNew: The WhatsNew object
    ///   - versionStore: The optional WhatsNewVersionStore. Default value `nil`
    ///   - layout: The WhatsNewView Layout. Default value `.default`
    public init(
        whatsNew: WhatsNew,
        versionStore: WhatsNewVersionStore? = nil,
        layout: Layout = .default
    ) {
        self.whatsNew = whatsNew
        self.whatsNewVersionStore = versionStore
        self.layout = layout
    }
    
}

// MARK: - View

extension WhatsNewView: View {
    
    /// The content and behavior of the view.
    public var body: some View {
        ZStack {
            // Content ScrollView
            ScrollView(
                .vertical,
                showsIndicators: false
            ) {
                // Content Stack
                VStack(
                    spacing: self.layout.contentSpacing
                ) {
                    // Title
                    self.title
                    // Feature List
                    VStack(
                        alignment: .leading,
                        spacing: self.layout.featureListSpacing
                    ) {
                        // Feature
                        ForEach(
                            self.whatsNew.features,
                            id: \.self,
                            content: self.feature
                        )
                    }
                    .adapativePadding(.features)
                    .padding(self.layout.featureListPadding)
                }
                .padding(.horizontal)
                .padding(self.layout.contentPadding)
                // ScrollView bottom content inset
                Color.clear
                    .padding(
                        .bottom,
                        self.layout.scrollViewBottomContentInset
                    )
            }
            // Footer
            VStack {
                Spacer()
                self.footer
                    .adapativePadding(.footer)
                    .background(
                        UIVisualEffectView
                            .Representable()
                            .edgesIgnoringSafeArea(.horizontal)
                            .padding(self.layout.footerVisualEffectViewPadding)
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

// MARK: - Title

private extension WhatsNewView {
    
    /// The Title View
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

// MARK: - Feature

private extension WhatsNewView {
    
    /// The Feature View
    /// - Parameter feature: A WhatsNew Feature
    func feature(
        _ feature: WhatsNew.Feature
    ) -> some View {
        HStack(
            spacing: self.layout.featureHorizontalSpacing
        ) {
            UIImageView.Representable(
                image: feature.image.uiImage,
                tintColor: feature.image.tintColor
            )
            .frame(width: self.layout.featureImageWidth)
            VStack(
                alignment: .leading,
                spacing: self.layout.featureVerticalSpacing
            ) {
                Text(
                    verbatim: feature.title
                )
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.primary)
                Text(
                    verbatim: feature.subtitle
                )
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.leading)
        }
    }
    
}

// MARK: - Footer

private extension WhatsNewView {
    
    /// The Footer View
    var footer: some View {
        VStack(
            spacing: self.layout.footerActionSpacing
        ) {
            // Check if a secondary action is available
            if let secondaryAction = self.whatsNew.secondaryAction {
                // Secondary Action Button
                Button(
                    action: {
                        // Invoke HapticFeedback
                        secondaryAction.hapticFeedback?()
                        // Invoke SecondaryAction
                        secondaryAction.action(
                            dismissAction: .init {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        )
                    }
                ) {
                    Text(
                        verbatim: secondaryAction.title
                    )
                }
                .foregroundColor(secondaryAction.foregroundColor)
            }
            // Primary Action Button
            Button(
                action: {
                    // Invoke HapticFeedback
                    self.whatsNew.primaryAction.hapticFeedback?()
                    // Invoke PrimaryAction
                    self.whatsNew.primaryAction.action(
                        dismissAction: .init {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    )
                }
            ) {
                HStack {
                    Spacer()
                    Text(
                        verbatim: self.whatsNew.primaryAction.title
                    )
                    .font(.headline.weight(.semibold))
                    .padding(.vertical)
                    Spacer()
                }
            }
            .background(self.whatsNew.primaryAction.backgroundColor)
            .foregroundColor(self.whatsNew.primaryAction.foregroundColor)
            .cornerRadius(14)
        }
    }
    
}
