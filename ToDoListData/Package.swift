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
            type: .dynamic,
            targets: ["ToDoListData"]
        )
    ],
    dependencies: [
        .package(path: "../ToDoListDomain")
    ],
    targets: [
        .target(
            name: "ToDoListData",
            dependencies: [
                .product(name: "ToDoListDomain", package: "ToDoListDomain", condition: nil)
            ],
            path: "."
        )
    ]
)
