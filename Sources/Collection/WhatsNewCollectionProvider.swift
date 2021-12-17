import Foundation

// MARK: - WhatsNewProvider

/// A WhatsNewCollection Provider type
public protocol WhatsNewCollectionProvider {
    
    /// A WhatsNewCollection
    @WhatsNewCollectionBuilder
    var whatsNewCollection: WhatsNewCollection { get }
    
}
