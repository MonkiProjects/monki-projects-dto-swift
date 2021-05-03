//
//  PlacemarkPropertyTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkPropertyTests: XCTestCase {
	
	typealias Property = Placemark.Property
	
	// MARK: - Valid Domain
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		XCTAssertThrowsError(
			try Property.feature("unknown").internal(in: Locale.en),
			"Placemark feature with id 'unknown' is not invalid"
		)
	}
	
}
