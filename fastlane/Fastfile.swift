// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

// MARK: - Fastfile

/// The FastFile
class Fastfile: LaneFile {
    
    /// The Options Typealias
    typealias Options = [String: String]
    
}

// MARK: - Release Lane

extension Fastfile {
    
    /// Release a new Version on Github/Carthage and CocoaPods
    ///
    /// - Parameter options: The options (version)
    func releaseLane(options: Options) {
        desc("Release a new Version")
        // Retrieve version from Options
        let version = options.get("version")
        // 1.Step Ensure Git Status is clean
        ensureGitStatusClean()
        // 2.Step Ensure Git Branch is master
        ensureGitBranch(branch: "master")
        // 3.Step Perform Tests
        self.testLane()
        // 4. Step Increment Version
        self.incrementVersionLane(options: options)
        // 5. Step Add Git-Tag
        addGitTag(tag: version, buildNumber: "1")
        // 6. Step Push Git-Tag
        pushGitTags()
        // 7. Step Push to Git-Remote
        pushToGitRemote()
        // 8. Step Pod Trunk Push
        podPush()
        // Log Message
        echo(message: "Version: \(version) has been successfully released 🚀")
    }
    
}

// MARK: - IncrementVersionNumber-Lane

extension Fastfile {
    
    /// Increment all Version Numbers in Podspec and Plist Files
    ///
    /// - Parameter options: The options (version)
    func incrementVersionLane(options: Options) {
        desc("Incremt Version Number")
        // Retrieve version from Options
        let version = options.get("version")
        // 1.Step Bump Podspec Version
        versionBumpPodspec(
            path: "WhatsNewKit.podspec",
            versionNumber: version
        )
        // Setup Info.plist Paths
        let infoPlistPaths = [
            "Configs/WhatsNewKit.plist",
            "Configs/WhatsNewKitTests.plist",
            "Example/Resources/Info.plist"
        ]
        // For Each Info.plist Path
        for infoPlistPath in infoPlistPaths {
            // 2.Step Set VersionString for current Info.plist
            setInfoPlistValue(
                key: "CFBundleShortVersionString",
                value: version,
                path: infoPlistPath
            )
        }
        // 3.Step Git commit all
        gitCommit(path: ".", message: "WhatsNewKit Version \(version) 🚀")
    }
    
}

// MARK: - Test-Lane

extension Fastfile {
    
    /// Perform Tests
    func testLane() {
        desc("Run Tests")
        // 1.Step Verify Carthage Build
        carthage(
            command: "build",
            noSkipCurrent: true,
            cacheBuilds: true
        )
        // 2.Step Pod Lib Lint
        podLibLint()
        // 3.Step Perform Tests
        scan(
            project: "WhatsNewKit.xcodeproj",
            scheme: "WhatsNewKit-iOS",
            clean: true,
            codeCoverage: true
        )
    }
    
}

// MARK: - CodeCoverage-Lane

extension Fastfile {
    
    /// Generate Code-Coverage with Slather
    func coverageLane() {
        desc("Run Code-Coverage")
        // 1.Step Run Slather to generate Code-Coverage
        slather(
            proj: "WhatsNewKit.xcodeproj",
            scheme: "WhatsNewKit-iOS",
            travis: true,
            coberturaXml: true,
            ignore: "Tests/*"
        )
    }
    
}

// MARK: - Dictionary Extension

extension Dictionary where Key == String, Value == String {
    
    /// Retrieve Key from Dictionary
    /// Will fail if Key isn't available
    ///
    /// - Parameters:
    ///   - key: The Option Key
    ///   - function: The function name. Default valeu `#function`
    /// - Returns: The Value
    func get(_ key: Key, function: String = #function) -> Value {
        guard let value = self[key] else {
            fatalError("\(function) Option: \(key) must be available")
        }
        return value
    }
    
    /// Retrieve Key from Dictionary if available
    ///
    /// - Parameter key: The Key
    /// - Returns: The found optional Value
    func getIfPresent(_ key: Key) -> Value? {
        return self[key]
    }
    
}
