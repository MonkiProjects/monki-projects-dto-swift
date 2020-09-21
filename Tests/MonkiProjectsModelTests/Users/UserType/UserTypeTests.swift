//
//  UserTypeTests.swift
//  MonkiProjectsModelTests
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiProjectsModel

final class UserTypeTests: XCTestCase {
	
	private let translations: [UserType: String] = [
		.user: "User",
		.bot: "Bot",
	]
	
	func testDefaultTranslation() {
		for (type, title) in translations {
			XCTAssertEqual(type.title, title)
		}
	}
	
	static var allTests = [
		("testDefaultTranslation", testDefaultTranslation),
	]
	
}
