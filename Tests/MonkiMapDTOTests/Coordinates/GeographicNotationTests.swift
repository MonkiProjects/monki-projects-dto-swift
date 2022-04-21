//
//  GeographicNotationTests.swift
//  MonkiMapDTOTests
//
//  Created by Rémi Bardon on 21/04/2022.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapDTO

/// - Warning: Will break if tests are run with an English locale.
internal final class GeographicNotationTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testDdIsValid() {
		// Test negative values
		XCTAssertEqual(
			Coordinate(latitude: -3.097654421387, longitude: -2.52355127568).ddNotation(),
			"-3,097654, -2,523551"
		)
	}
	
	func testDmIsValid() {
		// Test negative values
		XCTAssertEqual(
			Coordinate(latitude: -3.097654421387, longitude: -2.52355127568).dmNotation(),
			"-3° 5,859' N, -2° 31,413' E"
		)
	}
	
	func testDmsIsValid() {
		// Test negative values
		XCTAssertEqual(
			Coordinate(latitude: -3.097654421387, longitude: -2.52355127568).dmsNotation(),
			"-3° 5' 51,6\" N, -2° 31' 24,8\" E"
		)
	}
	
	// MARK: - Invalid Domain
	
}
