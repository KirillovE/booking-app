// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "RandomUserAPI",
    products: [
        .library(
            name: "RandomUserAPI",
            targets: ["RandomUserAPI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RandomUserAPI",
            dependencies: []
        ),
        .testTarget(
            name: "RandomUserAPITests",
            dependencies: ["RandomUserAPI"]
        ),
    ]
)
