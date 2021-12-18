//
//  PlaceCategoryTests.swift
//  MonkiMapDTOTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapDTO

internal final class PlaceCategoryTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for category in Place.Category.ID.allCases {
			XCTAssertTrue(
				category.rawValue.isValidId,
				"Invalid rawValue for '\(category)' ('\(category.rawValue)')."
			)
		}
	}
	
	func testsInitFromKindWorks() {
		for kind in Place.Kind.ID.nonDefaultCases {
			let result = Place.Category.ID(forKindId: kind)
			XCTAssertNotEqual(result, .unknown)
		}
	}
	
	// MARK: - Invalid Domain
	
}
