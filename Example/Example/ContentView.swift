import SwiftUI
import WhatsNewKit

// MARK: - ContentView

/// The ContentView
struct ContentView {
    
    /// The WhatsNew object
    @WhatsNewState(versionStore: .inMemory)
    private var whatsNew = WhatsNew(
        version: "1.0.0",
        title: "WhatsNewKit",
        features: [
            .init(
                image: .init(
                    systemName: "star.fill",
                    tintColor: .systemOrange
                ),
                title: "Showcase your new App Features",
                subtitle: "Easily present your new App features just like any other App from Apple."
            ),
            .init(
                image: .init(
                    systemName: "wand.and.stars",
                    tintColor: .systemCyan
                ),
                title: "Presented once per Version",
                subtitle: "When using the @WhatsNewState Property Wrapper the WhatsNew Sheet will only be presented once per version."
            ),
            .init(
                image: .init(
                    systemName: "gear.circle.fill",
                    tintColor: .systemGray
                ),
                title: "Configuration",
                subtitle: "Adjust colors, strings, haptic feedback, and behaviours to your needs."
            ),
            .init(
                image: .init(
                    systemName: "swift",
                    tintColor: .init(red: 240.0 / 255, green: 81.0 / 255, blue: 56.0 / 255, alpha: 1)
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
            hapticFeedback: .selection,
            action: .open(
                url: .init(string: "https://github.com/SvenTiigi/WhatsNewKit")
            )
        )
    )
    
}

// MARK: - View

extension ContentView: View {
    
    /// The content and behavior of the view
    var body: some View {
        NavigationView {
            ExampleListView()
                .navigationTitle("WhatsNewKit")
                .sheet(
                    whatsNew: self.$whatsNew
                )
        }
        .navigationViewStyle(.stack)
    }
    
}
