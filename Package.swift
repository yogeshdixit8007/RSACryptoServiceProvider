// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "RSACryptoServiceProvider",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "MyRSAApp", targets: ["MyRSAApp"]),
        .library(name: "UtilityHelperLib", targets: ["UtilityHelperLib"]),
    ],
    targets: [
        .target(
            name: "UtilityHelperLib",
            dependencies: []
        ),
        .executableTarget(
            name: "MyRSAApp",
            dependencies: ["UtilityHelperLib"]
        ),
        .testTarget(
            name: "UtilityHelperLibTests",
            dependencies: ["UtilityHelperLib"]
        ),
    ]
)
