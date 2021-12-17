import SwiftUI
import WhatsNewKit

// MARK: - ExampleListView

/// The ExampleListView
struct ExampleListView {
    
    /// The Examples
    private let examples = WhatsNew.Example.allCases
    
    /// The currently presented WhatsNew object
    @State
    private var whatsNew: WhatsNew?
    
}

// MARK: - View

extension ExampleListView: View {
    
    /// The content and behavior of the view
    var body: some View {
        List {
            Section(
                header: Text(
                    verbatim: "Examples"
                ),
                footer: Text(
                    verbatim: "Tap on an example to manually present a WhatsNewView"
                )
            ) {
                ForEach(
                    self.examples,
                    id: \.rawValue
                ) { example in
                    Button(
                        action: {
                            self.whatsNew = example.whatsNew
                        }
                    ) {
                        Text(
                            verbatim: example.displayName
                        )
                    }
                }
            }
        }
        .navigationTitle("WhatsNewKit")
        .sheet(
            whatsNew: self.$whatsNew
        )
    }
    
}

// MARK: - WhatsNew+Example

private extension WhatsNew {
    
    /// A WhatsNew Example
    enum Example: String, Codable, Hashable, CaseIterable {
        /// Calendar
        case calendar
        /// Maps
        case maps
        /// Translate
        case translate
    }
    
}

// MARK: - WhatsNew+Example+displayName

private extension WhatsNew.Example {
    
    /// The user friendly display name
    var displayName: String {
        self.rawValue.prefix(1).capitalized + self.rawValue.dropFirst()
    }
    
}

// MARK: - WhatsNew+Example+whatsNew

private extension WhatsNew.Example {
    
    /// The WhatsNew
    var whatsNew: WhatsNew {
        switch self {
        case .calendar:
            return .init(
                title: "What's New in Calendar",
                features: [
                    .init(
                        image: .init(
                            systemName: "envelope",
                            tintColor: .systemRed
                        ),
                        title: "Found Events",
                        subtitle: "Siri suggests events found in Mail, Messages, and Safari, so you can add them easily, such as flight reservations and hotel bookings."
                    ),
                    .init(
                        image: .init(
                            systemName: "clock",
                            tintColor: .systemRed
                        ),
                        title: "Time to Leave",
                        subtitle: "Calendar uses Apple Maps to look up locations, traffic conditions, and transit options to tell you when it's time to leave."
                    ),
                    .init(
                        image: .init(
                            systemName: "location",
                            tintColor: .systemRed
                        ),
                        title: "Location Suggestions",
                        subtitle: "Calendar suggests locations based on your past events and significant locations."
                    )
                ],
                primaryAction: .init(
                    backgroundColor: .red
                )
            )
        case .maps:
            return .init(
                title: "What's New in Maps",
                features: [
                    .init(
                        image: .init(
                            systemName: "map.fill",
                            tintColor: .systemGreen
                        ),
                        title: "Updated Map Style",
                        subtitle: "An improved design makes it easier to navigate and explore the map."
                    ),
                    .init(
                        image: .init(
                            systemName: "mappin.and.ellipse",
                            tintColor: .systemPink
                        ),
                        title: "All-New Place Cards",
                        subtitle: "Completely redesigned place cards make it easier to learn about and interact with places."
                    ),
                    .init(
                        image: .init(
                            systemName: "magnifyingglass",
                            tintColor: .systemBlue
                        ),
                        title: "Improved Search",
                        subtitle: "Finding places is now easier with filters and automatic updates when you're browsing results on the map."
                    )
                ],
                primaryAction: .init(backgroundColor: .blue),
                secondaryAction: .init(
                    title: "About Apple Maps & Privacy",
                    foregroundColor: .blue,
                    action: .openURL(.init(string: "maps://"))
                )
            )
        case .translate:
            return .init(
                title: .init(
                    text: .init(
                        "What's New in "
                        + AttributedString(
                            "Translate",
                            attributes: .foregroundColor(.cyan)
                        )
                    )
                ),
                features: [
                    .init(
                        image: .init(
                            systemName: "rectangle.portrait.bottomthird.inset.filled",
                            tintColor: .systemCyan
                        ),
                        title: "Conversation Views",
                        subtitle: "Choose a side-by-side or face-to-face conversation view."
                    ),
                    .init(
                        image: .init(
                            systemName: "mic",
                            tintColor: .systemCyan
                        ),
                        title: "Auto Translate",
                        subtitle: "Respond in conversations without tapping the microphone button."
                    ),
                    .init(
                        image: .init(
                            systemName: "iphone",
                            tintColor: .systemCyan
                        ),
                        title: "System-Wide Translation",
                        subtitle: "Translate selected text anywhere on your iPhone."
                    )
                ],
                primaryAction: .init(
                    backgroundColor: .cyan
                ),
                secondaryAction: .init(
                    title: "About Translation & Privacy",
                    foregroundColor: .cyan,
                    action: .openURL(
                        .init(string: "https://apple.com/privacy")
                    )
                )
            )
        }
    }
    
}

// MARK: - AttributeContainer+foregroundColor

private extension AttributeContainer {
    
    /// A AttributeContainer with a given foreground color
    /// - Parameter color: The foreground color
    static func foregroundColor(
        _ color: Color
    ) -> Self {
        var container = Self()
        container.foregroundColor = color
        return container
    }
    
}
