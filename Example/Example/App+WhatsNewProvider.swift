import SwiftUI
import WhatsNewKit

// MARK: - App+WhatsNewCollectionProvider

extension App: WhatsNewCollectionProvider {
    
    /// A WhatsNewCollection
    var whatsNewCollection: WhatsNewCollection {
        WhatsNew(
            version: "1.0.0",
            title: "WhatsNewKit",
            features: [
                .init(
                    image: .init(
                        systemName: "star.fill",
                        foregroundColor: .orange
                    ),
                    title: "Showcase your new App Features",
                    subtitle: "Present your new app features just like a native app from Apple."
                ),
                .init(
                    image: .init(
                        systemName: "wand.and.stars",
                        foregroundColor: .cyan
                    ),
                    title: "Automatic Presentation",
                    subtitle: .init(
                        try! AttributedString(
                            markdown: "Simply declare a WhatsNew per Version and present it automatically by using the `.whatsNewSheet()` modifier."
                        )
                    )
                ),
                .init(
                    image: .init(
                        systemName: "gear.circle.fill",
                        foregroundColor: .gray
                    ),
                    title: "Configuration",
                    subtitle: "Easily adjust colors, strings, haptic feedback, behaviours and the layout of the presented WhatsNewView to your needs."
                ),
                .init(
                    image: .init(
                        systemName: "swift",
                        foregroundColor: .init(.init(red: 240.0 / 255, green: 81.0 / 255, blue: 56.0 / 255, alpha: 1))
                    ),
                    title: "Swift Package Manager",
                    subtitle: "WhatsNewKit can be easily integrated via the Swift Package Manager."
                )
            ],
            primaryAction: .init(
                hapticFeedback: .notification(.success)
            ),
            secondaryAction: .init(
                title: "Learn more",
                action: .openURL(.init(string: "https://github.com/SvenTiigi/WhatsNewKit"))
            )
        )
    }
    
}
