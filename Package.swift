// swift-tools-version:5.5

import PackageDescription

let package = Package(
	name: "monki-projects-dto",
	defaultLocalization: "en",
	products: [
		.library(
			name: "MonkiProjectsDTO",
			targets: ["MonkiProjectsDTO"]
		),
		.library(
			name: "MonkiMapDTO",
			targets: ["MonkiMapDTO"]
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
			name: "MonkiProjectsDTO",
			dependencies: [
				.product(name: "Prefixed", package: "prefixed"),
			],
			resources: [
				.process("Resources"),
			]
		),
		.testTarget(
			name: "MonkiProjectsDTOTests",
			dependencies: ["MonkiProjectsDTO"]
		),
		// Monki Map Models
		.target(
			name: "MonkiMapDTO",
			dependencies: [
				.target(name: "MonkiProjectsDTO"),
				.product(name: "Algorithms", package: "swift-algorithms"),
				.product(name: "Logging", package: "swift-log"),
			],
			resources: [
				.process("Resources"),
			]
		),
		.testTarget(
			name: "MonkiMapDTOTests",
			dependencies: ["MonkiMapDTO"]
		),
	]
)
