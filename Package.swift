// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitUsers",
    platforms: [
        .macOS(.v10_12)
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0"))
    ],
    targets: [
        .target(
            name: "GitUsers",
            dependencies: ["GitUsersCore"]),
        .target(
            name: "GitUsersCore",
            dependencies: ["Services"]),
        .target(
            name: "Services",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "GitUsersTests",
            dependencies: ["GitUsers"]),
    ]
)
