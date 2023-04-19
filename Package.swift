// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Segment-Mixpanel",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Segment-Mixpanel",
            targets: ["Segment-Mixpanel"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/segmentio/analytics-ios", from: "4.0.0"),
        .package(url: "https://github.com/mixpanel/mixpanel-iphone", from: "5.0.0"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Segment-Mixpanel",
            dependencies: [
                .product(name: "Segment", package: "analytics-ios"),
                .product(name: "Mixpanel", package: "mixpanel-iphone"),
            ],
            path: "Pod/",
            sources: ["Classes"],
            publicHeadersPath: "Classes",
            cSettings: [
                .headerSearchPath("Classes")
            ]
        ),
    ]
)