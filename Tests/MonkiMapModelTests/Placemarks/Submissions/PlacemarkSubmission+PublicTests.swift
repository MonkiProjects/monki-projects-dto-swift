//
//  PlacemarkSubmission+PublicTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 24/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

internal final class PlacemarkSubmissionPublicTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testCodingKeysCasing() throws {
		let data = Placemark.Submission.Public(placemark: UUID())
		let jsonObject = try String(data: JSONEncoder().encode(data), encoding: .utf8).require()
		
		XCTAssertTrue(jsonObject.contains("positive_reviews"), "Coding keys are misconfigured: \(jsonObject)")
	}
	
	// MARK: - Invalid Domain
	
}
