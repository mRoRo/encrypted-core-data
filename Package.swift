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
    dependencies: [
        .package(
            url: "https://github.com/sqlcipher/sqlcipher.git",
            from: "3.4.0"
        )
    ],
    targets: [
        .target(
            name: "EncryptedCoreData",
            dependencies: [
                .product(name: "SQLCipher", package: "sqlcipher")
            ],
            path: "Incremental Store",
            sources: [
                "."
            ],
            publicHeadersPath: "include",
            cSettings: [
                .define("SQLITE_HAS_CODEC"),
                .define("SQLCIPHER_CRYPTO_CC"),
                .headerSearchPath("include"),
            ]
        ),
    ]
)
