import SwiftUI

// MARK: - Text+init(whatsNewText:)

extension Text {
    
    /// Creates a new instance of `Text` from a `WhatsNew.Text` instance
    /// - Parameter whatsNewText: The WhatsNew Text
    init(
        whatsNewText: WhatsNew.Text
    ) {
        // Check if iOS 15 or greater is available
        if #available(iOS 15, *) {
            // Initialize with AttributedString
            self.init(
                AttributedString(
                    whatsNewText.attributedString
                )
            )
        } else {
            // Initialize with raw string value
            self.init(
                verbatim: whatsNewText.attributedString.string
            )
        }
    }
    
}
