import SwiftUI

// MARK: - WhatsNewView+Footer

extension WhatsNewView {
    
    /// The WhatsNewView Footer component
    struct Footer {
        
        /// The WhatsNew PrimaryAction
        let primaryAction: WhatsNew.PrimaryAction
        
        /// The optional WhatsNew SecondaryAction
        let secondaryAction: WhatsNew.SecondaryAction?
        
        /// The PresentationMode Binding
        @Binding
        var presentationMode: PresentationMode
        
    }
    
}

// MARK: - Invoke Action

private extension WhatsNewView.Footer {
    
    /// Invoke WhatsNew Action
    /// - Parameter action: The Action
    func invoke(
        action: WhatsNew.Action
    ) {
        action(
            dismissAction: .init {
                self.presentationMode.dismiss()
            }
        )
    }
    
}

// MARK: - View

extension WhatsNewView.Footer: View {
    
    /// The content and behavior of the view.
    var body: some View {
        VStack(
            spacing: 15
        ) {
            if let secondaryAction = self.secondaryAction {
                Button(
                    action: {
                        // Invoke HapticFeedback
                        secondaryAction.hapticFeedback?()
                        // Invoke SecondaryAction
                        self.invoke(action: secondaryAction.action)
                    },
                    label: {
                        Text(
                            verbatim: secondaryAction.title
                        )
                    }
                )
                .foregroundColor(secondaryAction.foregroundColor)
            }
            Button(
                action: {
                    // Invoke HapticFeedback
                    self.primaryAction.hapticFeedback?()
                    // Invoke PrimaryAction
                    self.invoke(action: self.primaryAction.action)
                },
                label: {
                    HStack {
                        Spacer()
                        Text(
                            verbatim: self.primaryAction.title
                        )
                        .font(.headline.weight(.semibold))
                        .padding(.vertical)
                        Spacer()
                    }
                }
            )
            .background(self.primaryAction.backgroundColor)
            .foregroundColor(self.primaryAction.foregroundColor)
            .cornerRadius(14)
        }
    }
    
}
