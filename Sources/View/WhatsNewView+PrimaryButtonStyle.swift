import SwiftUI

// MARK: - WhatsNewView+PrimaryButtonStyle

extension WhatsNewView {
    
    /// The WhatsNewView PrimaryButtonStyle
    struct PrimaryButtonStyle {
        
        /// The WhatsNew PrimaryAction
        let primaryAction: WhatsNew.PrimaryAction
        
        /// The WhatsNew Layout
        let layout: WhatsNew.Layout
        
    }
    
}

// MARK: - ButtonStyle

extension WhatsNewView.PrimaryButtonStyle: ButtonStyle {
    
    /// Creates a view that represents the body of a button.
    /// - Parameter configuration: The properties of the button.
    func makeBody(
        configuration: Configuration
    ) -> some View {
        HStack {
            Spacer()
            configuration
                .label
                .font(.headline.weight(.semibold))
                .padding(.vertical)
            Spacer()
        }
        .foregroundColor(self.primaryAction.foregroundColor)
        .background(self.primaryAction.backgroundColor)
        .cornerRadius(self.layout.footerPrimaryActionButtonCornerRadius)
        .opacity(configuration.isPressed ? 0.5 : 1)
    }
    
}

