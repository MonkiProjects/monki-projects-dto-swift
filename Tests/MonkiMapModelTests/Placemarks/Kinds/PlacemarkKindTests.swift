//
//  PlacemarkKindTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkKindTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for kind in Placemark.Kind.allCases {
			XCTAssertNoThrow(
				try kind.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(kind)' ('\(kind.rawValue)')."
			)
		}
	}
	
	// MARK: - Invalid Domain
	
}
