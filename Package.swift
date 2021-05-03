// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "monki-projects-model",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
		.macOS(.v10_10),
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
	targets: [
		// Monki Projects Core Models
		.target(
			name: "MonkiProjectsModel",
			resources: [
				.process("Resources/Strings"),
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
				.process("Resources/Strings"),
			]
		),
		.testTarget(
			name: "MonkiMapModelTests",
			dependencies: ["MonkiMapModel"]
		),
	]
)
