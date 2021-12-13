//
//  PlaceFeatureKindTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 11/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

internal final class PlaceFeatureKindTests: XCTestCase {
	
	private typealias Kind = Place.Feature.Kind
	
	private let jsonDecoder = JSONDecoder()
	
	// MARK: - Valid Domain
	
	func testJSONDecodingWorks() throws {
		let data = try XCTUnwrap("""
		{
			"id": "feature",
			"label": "Feature",
			"section_title": "Features",
			"lang": "en"
		}
		""".data(using: .utf8), "Invalid encoding")
		
		XCTAssertNoThrow(try jsonDecoder.decode(Kind.DTO.Localized.self, from: data))
	}
	
	func testEncodeThenDecode() throws {
		let kind1 = Kind.DTO.Localized(id: .element, label: "test1", sectionTitle: "test2", locale: .en)
		let data = try JSONEncoder().encode(kind1)
		
		let expected = [
			"\"id\":\"element\"",
			"\"label\":\"test1\"",
			"\"section_title\":\"test2\"",
			"\"lang\":\"en\"",
		].sorted()
		let string = String(data: data, encoding: .utf8) ?? ""
		let actual = string.dropFirst().dropLast().split(separator: ",").map(String.init).sorted()
		XCTAssertEqual(actual, expected)
		
		let kind2 = try JSONDecoder().decode(Kind.DTO.Localized.self, from: data)
		XCTAssertEqual(kind1, kind2)
	}
	
	// MARK: - Invalid Domain
	
}
