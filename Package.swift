// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-string-catalogs",
    defaultLocalization: "en",
    products: [
        .library(
            name: "SwiftStringCatalogs",
            targets: ["SwiftStringCatalogs"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftStringCatalogs",
            path: "Sources/swift-string-catalogs",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "SwiftStringCatalogsTests",
            dependencies: ["SwiftStringCatalogs"],
            path: "Tests/swift-string-catalogsTests"
        ),
    ]
)
