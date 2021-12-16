//
//  User+DetailsTests.swift
//  MonkiProjectsDTOTests
//
//  Created by BARDON Rémi on 09/05/2021.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiProjectsDTO

internal final class UserDetailsTests: XCTestCase {
	
	func testEmptyDictionariesJSONEncoding() throws {
		let data = try JSONEncoder().encode(User.Details())
		let string = try XCTUnwrap(String(data: data, encoding: .utf8))
		
		XCTAssert(string.contains("\"experience\":{}"), string)
		XCTAssert(string.contains("\"social_usernames\":{}"), string)
	}
	
	func testDictionariesJSONEncoding() throws {
		let data = try JSONEncoder().encode(
			User.Details(
				experience: [.parkour: .beginner],
				socialUsernames: [.instagram: "monki_projects"]
			)
		)
		let string = try XCTUnwrap(String(data: data, encoding: .utf8))
		
		XCTAssert(string.contains("\"experience\":{\"parkour\":1}"), string)
		XCTAssert(string.contains("\"social_usernames\":{\"instagram\":\"monki_projects\"}"), string)
	}
	
}
