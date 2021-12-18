//
//  PlaceDetails+PublicTests.swift
//  MonkiMapDTOTests
//
//  Created by Rémi Bardon on 24/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapDTO

internal final class PlaceDetailsPublicTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testCodingKeysCasing() throws {
		let data = try Place.Details.DTO.Public(
			caption: "Test",
			satelliteImage: .url(URL(string: "https://monkiprojects.com").require())
		)
		let jsonObject = try String(data: JSONEncoder().encode(data), encoding: .utf8).require()
		
		XCTAssertTrue(jsonObject.contains("satellite_image"), "Coding keys are misconfigured: \(jsonObject)")
	}
	
	// MARK: - Invalid Domain
	
}
