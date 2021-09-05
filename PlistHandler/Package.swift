// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PlistHandler",
    products: [
        .library(
            name: "PlistHandler",
            targets: ["PlistHandler"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PlistHandler",
            dependencies: []
        ),
        .testTarget(
            name: "PlistHandlerTests",
            dependencies: ["PlistHandler"],
            resources: [
                .process("Test.plist")
            ]
        ),
    ]
)
