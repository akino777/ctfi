// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ctfi",
    products: [
        .executable(name: "ctfi", targets: ["ctfi"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", branch: "main"),
    ],
    targets: [
        .executableTarget(
            name: "ctfi",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "Tests",
            dependencies: ["ctfi"]
        ),
    ]
)
