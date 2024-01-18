// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "WhatsNewKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "WhatsNewKit",
            targets: ["WhatsNewKit"]
        )
    ],
    targets: [
        .target(
            name: "WhatsNewKit",
            path: "Sources"
        ),
        .testTarget(
            name: "WhatsNewKitTests",
            dependencies: ["WhatsNewKit"],
            path: "Tests"
        )
    ]
)
