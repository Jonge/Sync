// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Sync",
  platforms: [
    .iOS(.v15),
    .macOS(.v12)
  ],
  products: [
    .library(name: "Sync", targets: ["Sync"])
  ],
  targets: [
    // Objective-C part of Sync. SwiftPM does not support Swift and Objective-C in the same target.
    .target(
      name: "SyncObjC",
      path: "Source",
      sources: [
        "DateParser/NSDate+PropertyMapper.m",
        "Inflections/Inflections.m",
        "PrimaryKey/NSEntityDescription+PrimaryKey.m",
        "PropertyMapper/PropertyMapper.m",
        "PropertyMapper/NSManagedObject+PropertyMapperHelpers.m",
        "Sync/NSPropertyDescription+Sync.m"
      ],
      publicHeadersPath: "SyncObjC/include",
      cSettings: [
        .headerSearchPath("DateParser"),
        .headerSearchPath("Inflections"),
        .headerSearchPath("PrimaryKey"),
        .headerSearchPath("PropertyMapper"),
        .headerSearchPath("Sync")
      ]
    ),
    .target(
      name: "Sync",
      dependencies: ["SyncObjC"],
      path: "Source",
      exclude: [
        "Sync.h",
        "SyncObjC",
        "DateParser",
        "Inflections",
        "PrimaryKey",
        "PropertyMapper/PropertyMapper.h",
        "PropertyMapper/PropertyMapper.m",
        "PropertyMapper/NSManagedObject+PropertyMapperHelpers.h",
        "PropertyMapper/NSManagedObject+PropertyMapperHelpers.m",
        "Sync/NSPropertyDescription+Sync.h",
        "Sync/NSPropertyDescription+Sync.m"
      ]
    )
  ],
  swiftLanguageVersions: [.v5]
)
