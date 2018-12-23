// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPM-GithubAction",
    products: [
        .library(
            name: "SwiftPM-GithubAction",
            targets: ["SwiftPM-GithubAction"]),
    ],
    dependencies: [
         .package(url: "https://github.com/apple/example-package-fisheryates.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "SwiftPM-GithubAction",
            dependencies: ["FisherYates"]),
        .testTarget(
            name: "SwiftPM-GithubActionTests",
            dependencies: ["SwiftPM-GithubAction"]),
    ]
)
