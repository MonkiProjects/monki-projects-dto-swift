//
//  PlaceFeatureTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 30/11/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

internal final class PlaceFeatureTests: XCTestCase {
	
	private typealias Feature = Place.Feature
	
	private let jsonDecoder = JSONDecoder()
	
	// MARK: - Valid Domain
	
	func testJSONDecodingForSmallestFeature() throws {
		let data = try XCTUnwrap("""
		{
			"id": "feature_b4f0ec61-d42b-4a49-860f-5db098449cee",
			"kind": "feature_kind_70c37cde-315b-466d-bf2a-0df8fdb47e61",
			"system_defined": false,
			"lang": "en"
		}
		""".data(using: .utf8), "Invalid encoding")
		
		XCTAssertNoThrow(try jsonDecoder.decode(Feature.DTO.Localized.self, from: data))
	}
	
	func testJSONDecodingForCompleteFeature() throws {
		let featureId = "small_wall"
		let featureLabel = "Small wall"
		let featureKind = Feature.Kind.element
		let iconUrl = URL(staticString: "https://cdn.monkiprojects.com/assets/features/system/wall-small.png")
		let data = try XCTUnwrap("""
		{
			"id": "\(featureId)",
			"kind": "\(featureKind)",
			"system_defined": true,
			"icon_url": "\(iconUrl)",
			"label": "\(featureLabel)",
			"lang": "en"
		}
		""".data(using: .utf8), "Invalid encoding")
		
		XCTAssertNoThrow {
			let feature = try self.jsonDecoder.decode(Feature.DTO.Localized.self, from: data)
			XCTAssertEqual(feature.id, featureId)
			XCTAssertEqual(feature.kind, featureKind)
			XCTAssertTrue(feature.isSystemDefined)
			XCTAssertEqual(feature.iconUrl, iconUrl)
			XCTAssertEqual(feature.label, featureLabel)
		}
	}
	
	func testSystemDefinedKeyIsOptional() throws {
		let data = try XCTUnwrap("""
		{
			"id": "\(UUID())",
			"kind": "\(UUID())",
			"lang": "en"
		}
		""".data(using: .utf8), "Invalid encoding")
		
		XCTAssertNoThrow(try jsonDecoder.decode(Feature.DTO.Localized.self, from: data))
	}
	
	func testJSONNullValuesAreCorrectlyDecoded() throws {
		let data = try XCTUnwrap("""
		{
			"id": "\(UUID())",
			"kind": "\(UUID())",
			"icon_url": null,
			"label": null,
			"lang": "en"
		}
		""".data(using: .utf8), "Invalid encoding")
		
		XCTAssertNoThrow(try jsonDecoder.decode(Feature.DTO.Localized.self, from: data))
	}
	
	func testEncodeThenDecode() throws {
		let feature1 = Feature.DTO.Localized(id: "test", kind: .unknown, locale: .en)
		let data = try JSONEncoder().encode(feature1)
		
		let expected = "{\"id\":\"test\",\"kind\":\"unknown\",\"lang\":\"en\"}"
		XCTAssertEqual(String(data: data, encoding: .utf8), expected)
		
		let feature2 = try JSONDecoder().decode(Feature.DTO.Localized.self, from: data)
		XCTAssertEqual(feature1, feature2)
	}
	
	// MARK: - Invalid Domain
	
}
