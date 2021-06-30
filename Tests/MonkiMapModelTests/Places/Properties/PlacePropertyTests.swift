//
//  PlacePropertyTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

internal final class PlacePropertyTests: XCTestCase {
	
	private typealias Property = Place.Property
	
	// MARK: - Valid Domain
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		XCTAssertThrowsError(
			try Property.feature("unknown").internal(in: Locale.en),
			"Place feature with id 'unknown' is not invalid"
		)
	}
	
}
