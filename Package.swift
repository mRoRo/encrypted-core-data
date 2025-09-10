// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "EncryptedCoreData",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "EncryptedCoreData",
            targets: ["EncryptedCoreData"]
        ),
    ],
    targets: [
        .target(
            name: "EncryptedCoreData",
            path: "Incremental Store",
            publicHeadersPath: "include",
            dependencies: [
                .package(
                    url: "https://github.com/sqlcipher/sqlcipher.git",
                    exact: "v3.4.2"
                )
            ],
        ),
        .testTarget(
            name: "EncryptedCoreDataTests",
            dependencies: ["EncryptedCoreData"],
            path: "Tests"
        ),
    ]
)
