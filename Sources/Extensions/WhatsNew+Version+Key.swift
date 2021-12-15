import Foundation

// MARK: - WhatsNew.Version+key(prefix:)

extension WhatsNew.Version {
    
    /// Make a WhatsNew Version Key the can be used to save
    /// a WhatsNew Version in the `UserDefaults` or `NSUbiquitousKeyValueStore`
    /// - Parameter prefix: The optional prefix
    /// - Returns: The key
    func key(
        prefix: String?
    ) -> String {
        [
            prefix,
            "WhatsNewKit",
            self.description
        ]
        .compactMap { $0 }
        .filter { !$0.isEmpty }
        .joined(separator: ".")
    }
    
}
