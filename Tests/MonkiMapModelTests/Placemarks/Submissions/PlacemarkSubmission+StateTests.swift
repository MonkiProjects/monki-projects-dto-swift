//
//  PlacemarkSubmission+StateTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 24/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

internal final class PlacemarkSubmissionStateTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testCodingKeysCasing() throws {
		let data = Placemark.Submission.State.waitingForChanges
		let jsonObject = try String(data: JSONEncoder().encode(data), encoding: .utf8).require()
		
		XCTAssertEqual(jsonObject, "\"waiting_for_changes\"", "Coding keys are misconfigured: \(jsonObject)")
	}
	
	// MARK: - Invalid Domain
	
}
