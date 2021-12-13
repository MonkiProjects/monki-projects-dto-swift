// swift-tools-version:5.5

import PackageDescription

let package = Package(
	name: "monki-projects-model",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v15),
		.macOS(.v12),
	],
	products: [
		.library(
			name: "MonkiProjectsModel",
			targets: ["MonkiProjectsModel"]
		),
		.library(
			name: "MonkiMapModel",
			targets: ["MonkiMapModel"]
		),
	],
	dependencies: [
		.package(
			name: "prefixed",
			url: "https://github.com/RemiBardon/swift-prefixed-type",
			.upToNextMajor(from: "2.0.0")
		),
		.package(url: "https://github.com/apple/swift-algorithms", .upToNextMajor(from: "1.0.0")),
		.package(url: "https://github.com/apple/swift-log.git", .upToNextMajor(from: "1.4.2")),
	],
	targets: [
		// Monki Projects Core Models
		.target(
			name: "MonkiProjectsModel",
			dependencies: [
				.product(name: "Prefixed", package: "prefixed"),
			],
			resources: [
				.process("Resources"),
			]
		),
		.testTarget(
			name: "MonkiProjectsModelTests",
			dependencies: ["MonkiProjectsModel"]
		),
		// Monki Map Models
		.target(
			name: "MonkiMapModel",
			dependencies: [
				.target(name: "MonkiProjectsModel"),
				.product(name: "Algorithms", package: "swift-algorithms"),
				.product(name: "Logging", package: "swift-log"),
			],
			resources: [
				.process("Resources"),
			]
		),
		.testTarget(
			name: "MonkiMapModelTests",
			dependencies: ["MonkiMapModel"]
		),
	]
)
