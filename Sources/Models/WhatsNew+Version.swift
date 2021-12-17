import Foundation

// MARK: - WhatsNew+Version

public extension WhatsNew {
    
    /// A WhatsNew Version
    struct Version: Hashable {
        
        // MARK: Properties
        
        /// The major version
        public let major: Int
        
        /// The minor version
        public let minor: Int
        
        /// The patch version
        public let patch: Int
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Version`
        /// - Parameters:
        ///   - major: The major version
        ///   - minor: The minor version
        ///   - patch: The patch version
        public init(
            major: Int,
            minor: Int,
            patch: Int
        ) {
            self.major = major
            self.minor = minor
            self.patch = patch
        }
        
    }
    
}

// MARK: - Comparable

extension WhatsNew.Version: Comparable {
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.description.compare(rhs.description, options: .numeric) == .orderedAscending
    }
    
}

// MARK: - CustomStringConvertible

extension WhatsNew.Version: CustomStringConvertible {
    
    /// A textual representation of this instance.
    public var description: String {
        [
            self.major,
            self.minor,
            self.patch
        ]
        .map(String.init)
        .joined(separator: ".")
    }
    
}

// MARK: - ExpressibleByStringLiteral

extension WhatsNew.Version: ExpressibleByStringLiteral {
    
    /// Creates an instance initialized to the given string value.
    /// - Parameter value: The value of the new instance.
    public init(
        stringLiteral value: String
    ) {
        let components = value.components(separatedBy: ".").compactMap(Int.init)
        self.major = components.indices.contains(0) ? components[0] : 0
        self.minor = components.indices.contains(1) ? components[1] : 0
        self.patch = components.indices.contains(2) ? components[2] : 0
    }
    
}

// MARK: - Current

public extension WhatsNew.Version {
    
    /// Retrieve current WhatsNew Version based on the current Version String in the Bundle
    /// - Parameter bundle: The Bundle. Default value `.main`
    /// - Returns: WhatsNew.Version
    static func current(
        in bundle: Bundle = .main
    ) -> WhatsNew.Version {
        // Retrieve Bundle short Version String
        let shortVersionString = bundle.infoDictionary?["CFBundleShortVersionString"] as? String
        // Return initialized Version via String Literal
        return .init(
            stringLiteral: shortVersionString ?? ""
        )
    }
    
}

