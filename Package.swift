// swift-tools-version:5.9
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
        .package(url: "https://github.com/sqlcipher/SQLCipher.git", from: "3.4.0"),
        .package(url: "https://github.com/mRoRo/encrypted-core-data", branch: "Xcode-26")
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