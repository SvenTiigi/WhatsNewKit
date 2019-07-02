// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "WhatsNewKit",
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
