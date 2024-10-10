import SwiftUI

// MARK: - WhatsNew+VersionTextConfiguration

public extension WhatsNew {

    /// The WhatsNew VersionTextConfiguration
    struct VersionTextConfiguration {

        // MARK: Properties

        /// The version text font
        public var font: Font

        /// The foreground color
        public var foregroundColor: Color

        // MARK: Initializer

        /// Creates a new instance of `WhatsNew.VersionTextConfiguration`
        /// - Parameters:
        ///   - font: The version text font. Default value `.footnote`
        ///   - foregroundColor: The foreground color. Default value `.primary`
        public init(
            font: Font = .footnote,
            foregroundColor: Color = .primary
        ) {
            self.font = font
            self.foregroundColor = foregroundColor
        }

    }

}
