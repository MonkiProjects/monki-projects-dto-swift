//
//  MPUserTypeTests.swift
//  MonkiProjectsModelTests
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import Model

final class MPUserTypeTests: XCTestCase {
	
	private let translations: [MPUserType: String] = [
		.user: "User",
		.bot: "Bot",
	]
	
	func testDefaultTranslation() {
		XCTAssert(
			MPUserType.allCases.allSatisfy({ translations[$0] != nil }),
			"Missing key in Dictionary"
		)
		
		for (type, title) in translations {
			XCTAssertEqual(type.title, title)
		}
	}
	
	static var allTests = [
		("testDefaultTranslation", testDefaultTranslation),
	]
	
}
