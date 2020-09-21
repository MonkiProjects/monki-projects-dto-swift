//
//  SportLevelTests.swift
//  MonkiProjectsModelTests
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiProjectsModel

final class SportLevelTests: XCTestCase {
	
	private let translations: [SportLevel: String] = [
		.neverTried: "Never tried",
		.beginner: "Beginner",
		.intermediate: "Intermediate",
		.advanced: "Advanced",
		.professional: "Professional",
	]
	
	func testDefaultTranslation() {
		XCTAssert(
			SportLevel.allCases.allSatisfy({ translations[$0] != nil }),
			"Missing key in Dictionary"
		)
		
		for (level, title) in translations {
			XCTAssertEqual(level.title, title)
		}
	}
	
	static var allTests = [
		("testDefaultTranslation", testDefaultTranslation),
	]
	
}
