// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCContributeRank",
    platforms: [.macOS(.v10_13)],
    products: [
        .executable(name: "rank", targets: ["XCContributeRank"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "XCContributeRank",
            dependencies: ["XCContributeRankCore", .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .target(name: "XCContributeRankCore"),
        .testTarget(
            name: "XCContributeRankTests",
            dependencies: ["XCContributeRank"]),
    ]
)
