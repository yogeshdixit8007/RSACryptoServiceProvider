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
            name: "MyRSAApp",
            dependencies: ["UtilityHelperLib"], // Use the library here
            path: "Sources/MyRSAApp"
        ),
        .target(  // New target for UtilityHelper
            name: "UtilityHelperLib",
            dependencies: [],
            path: "Sources/UtilityHelperLib"  // Place the UtilityHelper code here
        ),
        .testTarget(
            name: "MyRSAAppTests",
            dependencies: ["MyRSAApp", "UtilityHelperLib"],  // Test depends on both
            path: "Tests"
        )
    ]
)
