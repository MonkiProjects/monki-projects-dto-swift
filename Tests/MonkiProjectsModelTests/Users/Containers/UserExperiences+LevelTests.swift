//
//  UserExperiences+LevelTests.swift
//  MonkiProjectsModelTests
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiProjectsModel

final class UserExperiencesLevelTests: XCTestCase {
	
	private let translations: [UserExperiences.Level: String] = [
		.neverTried: "Never tried",
		.beginner: "Beginner",
		.intermediate: "Intermediate",
		.advanced: "Advanced",
		.professional: "Professional",
	]
	
	func testDefaultTranslation() {
		for (level, title) in translations {
			XCTAssertEqual(level.title, title)
		}
	}
	
	static var allTests = [
		("testDefaultTranslation", testDefaultTranslation),
	]
	
}
