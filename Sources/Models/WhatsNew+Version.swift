import Foundation

// MARK: - WhatsNew+Version

public extension WhatsNew {
    
    /// A WhatsNew Version
    struct Version: Hashable {
        
        // MARK: Properties
        
        /// The major version
        public var major: Int
        
        /// The minor version
        public var minor: Int
        
        /// The patch version
        public var patch: Int
        
        /// The build number
        public var build: Int
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Version`
        /// - Parameters:
        ///   - major: The major version
        ///   - minor: The minor version
        ///   - patch: The patch version
        ///
        /// By default, if not provided, 0 will be used for the build number.
        public init(
            major: Int,
            minor: Int,
            patch: Int,
            build: Int = 0
        ) {
            self.major = major
            self.minor = minor
            self.patch = patch
            self.build = build
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
            self.shortVersionRepr,
            String(self.build)
        ]
        .joined(separator: "-")
    }
    
    public var shortVersionRepr: String {
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
        let components = value.components(separatedBy: .init(charactersIn: ".-")).compactMap(Int.init)
        self.major = components.indices.contains(0) ? components[0] : 0
        self.minor = components.indices.contains(1) ? components[1] : 0
        self.patch = components.indices.contains(2) ? components[2] : 0
        self.build = components.indices.contains(3) ? components[3] : 0
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
        let shortVersionString = (bundle.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
        let buildNumberString = bundle.infoDictionary?["CFBundleVersion"] as? String

        let versionString = {
            if let buildNumberString {
                return [shortVersionString, buildNumberString].joined(separator: "-")
            }
            return shortVersionString
        }()
        
        // Return initialized Version via String Literal
        return .init(
            stringLiteral: versionString
        )
    }
}

