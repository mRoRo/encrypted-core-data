// swift-tools-version:5.3
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
    dependencies: [
        .package(url: "https://github.com/stephencelis/SQLCipher.git", from: "3.4.0")
    ],
    targets: [
        .target(
            name: "EncryptedCoreData",
            dependencies: [
                .product(name: "SQLCipher", package: "SQLCipher")
            ]
        )
    ]
)