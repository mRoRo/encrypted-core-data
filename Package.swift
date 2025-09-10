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
            url: "https://github.com/sqlcipher/SQLCipher.swift.git",
            from: "4.10.0")
    ],
    targets: [
        .target(
            name: "EncryptedCoreData",
            dependencies: [
                .product(name: "SQLCipher", package: "SQLCipher.swift")
            ],
            path: "Incremental_Store",
            publicHeadersPath: "include",
            cSettings: [
                .define("SQLITE_HAS_CODEC"),
                .define("SQLCIPHER_CRYPTO_CC"),
                .headerSearchPath("include")
            ],
            linkerSettings: [
                .linkedFramework("CoreData"),
                .linkedFramework("Security")
            ]
        ),
        .testTarget(
            name: "EncryptedCoreDataTests",
            dependencies: ["EncryptedCoreData"],
            cSettings: [
                .define("SQLITE_HAS_CODEC")
            ]
        ),
    ]
)

