//
//  UserKindTests.swift
//  MonkiProjectsModelTests
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiProjectsModel

internal final class UserKindTests: XCTestCase {
	
	private let translations: [User.Kind: String] = [
		.user: "User",
		.bot: "Bot",
	]
	
	func testDefaultTranslation() {
		XCTAssert(
			User.Kind.allCases.allSatisfy({ translations[$0] != nil }),
			"Missing key in Dictionary"
		)
		
		for (kind, title) in translations {
			XCTAssertEqual(kind.title, title)
		}
	}
	
}
