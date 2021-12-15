import SwiftUI

// MARK: - View+sheet(whatsNew:)

public extension View {
    
    /// Presents a WhatsNewView using the given WhatsNew object as a data source for the sheet’s content.
    /// - Parameters:
    ///   - whatsNew: The WhatsNew object
    ///   - layout: The WhatsNewView Layout. Default value `.default`
    ///   - onDimiss: The closure to execute when dismissing the sheet. Default value `nil`
    func sheet(
        whatsNew: Binding<WhatsNew?>,
        layout: WhatsNewView.Layout = .default,
        onDimiss: (() -> Void)? = nil
    ) -> some View {
        self.sheet(
            item: whatsNew,
            onDismiss: onDimiss
        ) { whatsNew in
            WhatsNewView(
                whatsNew: whatsNew,
                layout: layout
            )
        }
    }
    
    /// Presents a WhatsNew sheet using the given WhatsNewState as a data source for the sheet’s content.
    /// - Parameters:
    ///   - whatsNewState: The WhatsNewState
    ///   - layout: The WhatsNewView Layout. Default value `.default`
    ///   - onDimiss: The closure to execute when dismissing the sheet. Default value `nil`
    func sheet(
        whatsNew whatsNewState: WhatsNewState,
        layout: WhatsNewView.Layout = .default,
        onDimiss: (() -> Void)? = nil
    ) -> some View {
        self.sheet(
            item: whatsNewState.binding,
            onDismiss: onDimiss
        ) { whatsNew in
            WhatsNewView(
                whatsNew: whatsNew,
                versionStore: whatsNewState.whatsNewVersionStore,
                layout: layout
            )
        }
    }
    
}
