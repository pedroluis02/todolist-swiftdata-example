// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ToDoListData",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "ToDoListData",
            targets: ["ToDoListData"]
        )
    ],
    dependencies: [
        .package(path: "../ToDoListDomain"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1")
    ],
    targets: [
        .target(
            name: "ToDoListData",
            dependencies: [
                .product(name: "ToDoListDomain", package: "ToDoListDomain"),
                "Swinject"
            ]
        ),
        .testTarget(
            name: "ToDoListDataTests",
            dependencies: ["ToDoListData"]
        )
    ]
)
