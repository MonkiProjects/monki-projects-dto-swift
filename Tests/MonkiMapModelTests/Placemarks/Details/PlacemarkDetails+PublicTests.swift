//
//  PlacemarkDetails+PublicTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 24/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

internal final class PlacemarkDetailsPublicTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testCodingKeysCasing() throws {
		let data = try Placemark.Details.Public(
			caption: "Test",
			satelliteImage: URL(string: "https://monkiprojects.com").require()
		)
		let jsonObject = try String(data: JSONEncoder().encode(data), encoding: .utf8).require()
		
		XCTAssertTrue(jsonObject.contains("satellite_image"), "Coding keys are misconfigured: \(jsonObject)")
	}
	
	// MARK: - Invalid Domain
	
}
