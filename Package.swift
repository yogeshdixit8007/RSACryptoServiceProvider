// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MyRSAApp",
    products: [
        .executable(
            name: "MyRSAApp",
            targets: ["MyRSAApp"]
        ),
        .library(
            name: "UtilityHelperLib",
            targets: ["UtilityHelperLib"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UtilityHelperLib",
            dependencies: [],
            path: "Sources/UtilityHelperLib"
        ),
        .target(
            name: "MyRSAApp",
            dependencies: ["UtilityHelperLib"],
            path: "Sources/MyRSAApp"
        ),
        .testTarget(
            name: "MyRSAAppTests",
            dependencies: ["UtilityHelperLib"],
            path: "Tests/MyRSAAppTests"
        )
    ]
)
