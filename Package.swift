// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "monki-projects-model",
	defaultLocalization: "en",
	products: [
		.library(
			name: "MonkiProjectsModel",
			targets: ["MonkiProjectsModel"]
		),
	],
	targets: [
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
	]
)
