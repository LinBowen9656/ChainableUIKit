// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChainableUIKit",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "ChainableUIKit",
            targets: ["ChainableUIKit", "UIKitObjectiveCUtils"])
    ],
    targets: [
        .target(name: "UIKitUtils"),
        .target(name: "ChainableUIKit", dependencies: [.target(name: "UIKitUtils")]),
        .target(
            name: "UIKitObjectiveCUtils",
            dependencies: [.target(name: "UIKitUtils")],
            publicHeadersPath: ""
        ),
        .testTarget(name: "ChainableUIKitTests", dependencies: ["ChainableUIKit"])
    ]
)
