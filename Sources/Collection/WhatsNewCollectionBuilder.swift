import Foundation

// MARK: - WhatsNewCollectionBuilder

/// A WhatsNewCollectionBuilder
@resultBuilder
public enum WhatsNewCollectionBuilder {}

// MARK: - ResultBuilder

public extension WhatsNewCollectionBuilder {
    
    /// Build WhatsNewCollection
    /// - Parameter components: The WhatsNew elements
    static func buildBlock(
        _ components: WhatsNewCollection.Element?...
    ) -> WhatsNewCollection {
        components.compactMap { $0 }
    }
    
    /// Build optional WhatsNewCollection
    /// - Parameter component: The optional WhatsNewCollection
    static func buildOptional(
        _ component: WhatsNewCollection?
    ) -> WhatsNewCollection {
        component ?? .init()
    }
    
    /// Build either first WhatsNewCollection
    /// - Parameter component: The first WhatsNewCollection
    static func buildEither(
        first component: WhatsNewCollection
    ) -> WhatsNewCollection {
        component
    }
    
    /// Build either second WhatsNewCollection
    /// - Parameter component: The second WhatsNewCollection
    static func buildEither(
        second component: WhatsNewCollection
    ) -> WhatsNewCollection {
        component
    }
    
    /// Build array of WhatsNewCollections
    /// - Parameter components: The array of WhatsNewCollections
    static func buildArray(
        _ components: [WhatsNewCollection]
    ) -> WhatsNewCollection {
        components.flatMap { $0 }
    }
    
}
