import SwiftUI

// MARK: - View+sheet(whatsNew:)

public extension View {
    
    /// Presents a WhatsNewView using the given WhatsNew object as a data source for the sheet’s content.
    /// - Parameters:
    ///   - whatsNew: The WhatsNew object
    ///   - versionStore: The optional WhatsNewVersionStore. Default value `nil`
    ///   - layout: The WhatsNewView Layout. Default value `.default`
    ///   - onDimiss: The closure to execute when dismissing the sheet. Default value `nil`
    func sheet(
        whatsNew: Binding<WhatsNew?>,
        versionStore: WhatsNewVersionStore? = nil,
        layout: WhatsNewView.Layout = .default,
        onDimiss: (() -> Void)? = nil
    ) -> some View {
        self.sheet(
            item: whatsNew,
            onDismiss: onDimiss
        ) { whatsNew in
            WhatsNewView(
                whatsNew: whatsNew,
                versionStore: versionStore,
                layout: layout
            )
        }
    }
    
}

// MARK: - View+whatsNewSheet()

public extension View {
    
    /// Auto-Presents a WhatsNewView to the user if needed based on the `WhatsNewEnvironment`
    /// - Parameters:
    ///   - layout: The optional custom WhatsNewView Layout. Default value `nil`
    ///   - onDimiss: The closure to execute when dismissing the sheet. Default value `nil`
    func whatsNewSheet(
        layout: WhatsNewView.Layout? = nil,
        onDismiss: (() -> Void)? = nil
    ) -> some View {
        self.modifier(
            WhatsNewSheetViewModifier(
                layout: layout,
                onDismiss: onDismiss
            )
        )
    }
    
}

// MARK: - WhatsNewSheetViewModifier

/// A WhatsNew Sheet ViewModifier
private struct WhatsNewSheetViewModifier: ViewModifier {
    
    // MARK: Properties
    
    /// The optional WhatsNewView Layout
    let layout: WhatsNewView.Layout?
    
    /// The optional closure to execute when dismissing the sheet
    let onDismiss: (() -> Void)?
    
    /// Bool value if sheet is dismissed
    @State
    private var isDismissed: Bool?
    
    /// The WhatsNewEnvironment
    @Environment(\.whatsNew)
    private var whatsNew
    
    // MARK: ViewModifier
    
    /// Gets the current body of the caller.
    /// - Parameter content: The Content
    func body(
        content: Content
    ) -> some View {
        content.sheet(
            whatsNew: .init(
                get: {
                    self.isDismissed == true ? nil : self.whatsNew.getPresentableWhatsNew()
                },
                set: {
                    self.isDismissed = $0 == nil
                }
            ),
            versionStore: self.whatsNew.whatsNewVersionStore,
            layout: self.layout ?? self.whatsNew.defaultLayout,
            onDimiss: self.onDismiss
        )
    }
    
}
