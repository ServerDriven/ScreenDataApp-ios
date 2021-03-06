// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScreenDataApp",
    platforms: [
        .iOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ScreenDataApp",
            targets: ["ScreenDataApp"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/ServerDriven/ScreenDataUI-ios",
            from: "1.1.2"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ScreenDataApp",
            dependencies: [
                .product(name: "ScreenDataUI", package: "ScreenDataUI-ios")
            ]
        ),
        .testTarget(
            name: "ScreenDataAppTests",
            dependencies: ["ScreenDataApp"]
        )
    ]
)
