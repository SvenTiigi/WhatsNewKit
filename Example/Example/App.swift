import SwiftUI
import WhatsNewKit

// MARK: - App

/// The App
@main
struct App {}

// MARK: - SwiftUI.App

extension App: SwiftUI.App {
    
    /// The content and behavior of the app.
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.whatsNew,
                     .init(
                        versionStore: InMemoryWhatsNewVersionStore(),
                        whatsNew: self
                     )
                )
        }
    }
    
}
