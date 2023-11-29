// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ToDoListDomain",
    products: [
        .library(
            name: "ToDoListDomain",
            type: .dynamic,
            targets: ["ToDoListDomain"]
        )
    ],
    targets: [
        .target(
            name: "ToDoListDomain",
            path: "."
        )
    ]
)
