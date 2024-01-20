import SwiftUI
import WhatsNewKit

// MARK: - ContentView

/// The ContentView
struct ContentView {}

// MARK: - View

extension ContentView: View {
    
    /// The content and behavior of the view
    var body: some View {
        NavigationStack {
            ExamplesView()
        }
        .whatsNewSheet()
    }
    
}
