// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KituraSandbox",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.6.0"),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.9.0"),
        .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.6.4"),
        .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.5"),
        .package(url: "https://github.com/IBM-Swift/Kitura-OpenAPI.git", from: "1.3.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-WebSocket.git", from: "2.1.2"),
        //.package(url:  "https://github.com/IBM-Swift/Kitura-WebSocket-NIO.git", from: "2.1.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "KituraSandbox",
            dependencies: [.target(name: "Application"), .target(name: "ChatService"), "HeliumLogger"]),
        
        .target(name: "Application", dependencies: ["Kitura", "KituraOpenAPI", "SwiftMetrics","Health"]),
        .target(name: "ChatService", dependencies: ["Kitura-WebSocket"]),
    ]
)
