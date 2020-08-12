// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LeagueAPI",
    products: [
        .library(
            name: "LeagueAPI",
            targets: ["LeagueAPI"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "LeagueAPI", path: "LeagueAPI/LeagueAPI"),
    ]
)