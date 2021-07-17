// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "CGKStateMachine",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "CGKStateMachine",
            targets: ["CGKStateMachine"]
        ),
    ],
    dependencies: [
        .package(name: "AppLogger", url: "https://github.com/backslash-f/applogger", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "CGKStateMachine",
            dependencies: ["AppLogger"]
        ),
        .testTarget(
            name: "CGKStateMachineTests",
            dependencies: ["CGKStateMachine"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
