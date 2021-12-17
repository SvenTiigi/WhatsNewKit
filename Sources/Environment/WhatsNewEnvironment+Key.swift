import SwiftUI

// MARK: - WhatsNewEnvironment+Key

public extension WhatsNewEnvironment {
    
    /// The WhatsNewEnvironment Key
    struct Key: EnvironmentKey {
        
        /// The default value for the environment key
        public static var defaultValue = WhatsNewEnvironment()
        
    }
    
}

// MARK: - EnvironmentValues+whatsNew

public extension EnvironmentValues {
    
    /// The WhatsNewEnvironment
    var whatsNew: WhatsNewEnvironment {
        get {
            self[WhatsNewEnvironment.Key.self]
        }
        set {
            self[WhatsNewEnvironment.Key.self] = newValue
        }
    }
    
}
