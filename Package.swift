// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAsyncAssert",
    products: [
        .library(
            name: "SwiftAsyncAssert",
            targets: ["SwiftAsyncAssert"]),
    ],
    targets: [
        .target(name: "SwiftAsyncAssert"),
        .testTarget(
            name: "SwiftAsyncAssertTests",
            dependencies: ["SwiftAsyncAssert"]),
    ]
)
