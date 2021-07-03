//
//  PlaceSubmissionReviewIssue+ReasonTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 24/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

internal final class PlaceSubmissionReviewIssueReasonTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testCodingKeysCasing() throws {
		let data = Place.Submission.Review.Issue.Reason.satelliteImage
		let jsonObject = try String(data: JSONEncoder().encode(data), encoding: .utf8).require()
		
		XCTAssertEqual(jsonObject, "\"satellite_image\"", "Coding keys are misconfigured: \(jsonObject)")
	}
	
	// MARK: - Invalid Domain
	
}
