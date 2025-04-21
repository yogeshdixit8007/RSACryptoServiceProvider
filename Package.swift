// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MyRSAApp",
    products: [
        .executable(
            name: "MyRSAApp",
            targets: ["MyRSAApp"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MyRSAApp",
            dependencies: [],
            path: "Sources/MyRSAApp"
        ),
        .testTarget(
            name: "MyRSAAppTests",
            dependencies: ["MyRSAApp"],
            path: "Tests"
        ),
    ]
)
