// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "monki-projects-model",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_10),
		.watchOS(.v6),
		.tvOS(.v13),
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
			dependencies: ["MonkiProjectsModel"],
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
