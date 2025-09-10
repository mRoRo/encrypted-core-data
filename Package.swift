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
            path: "Incremental Store",
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
            path: "Tests"
        ),
    ]
)
