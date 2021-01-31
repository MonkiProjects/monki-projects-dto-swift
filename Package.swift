// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "monki-projects-model",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
		.macOS(.v10_10)
	],
	products: [
		.library(
			name: "MonkiProjectsModel",
			targets: ["Model"]
		),
	],
	targets: [
		.target(
			name: "Model",
			resources: [
				.process("Resources/Strings"),
			]
		),
		.testTarget(
			name: "ModelTests",
			dependencies: ["Model"]
		),
	]
)
