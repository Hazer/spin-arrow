// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SpinArrow",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "SpinArrow",
            targets: ["SpinArrow"])
    ],
    targets: [
        .target(
            name: "SpinArrow",
            path: "spin-arrow/Classes")
    ]
)
