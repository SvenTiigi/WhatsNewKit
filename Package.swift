// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "WhatsNewKit",
    platforms: [
        .iOS("9.0")
    ],
    products: [
        .library(
            name: "WhatsNewKit",
            targets: ["WhatsNewKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WhatsNewKit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "WhatsNewKitTests",
            dependencies: ["WhatsNewKit"],
            path: "Tests"
        ),
    ]
)
