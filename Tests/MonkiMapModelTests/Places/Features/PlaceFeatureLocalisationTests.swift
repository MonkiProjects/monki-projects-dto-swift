//
//  PlaceFeatureLocalisationTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 09/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

internal final class PlaceFeatureLocalisationTests: XCTestCase {
	
	private typealias Feature = Place.Feature
	
	// MARK: - Valid Domain
	
	func testLocalizedFeatureHasCorrectTitle() throws {
		let id = "wall-small"
		let feature = Feature(id: id, kind: .element)
		
		// Test English translation
		do {
			let result = try feature.localized(locale: .en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.label, "Small wall")
		}
		
		// Test French translation
		do {
			let result = try feature.localized(locale: .fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.label, "Petit mur")
		}
	}
	
	func testAllFeaturesAreTranslated() throws {
		var translations = [Locale: Set<String>]()
		for locale in Locale.supported {
			translations[locale] = Set(Feature.DTO.Localized.all(locale: locale).map(\.id))
		}
		
		let baseTranslationIds = try XCTUnwrap(translations.removeValue(forKey: .en))
		for (locale, ids) in translations {
			let missing = baseTranslationIds.subtracting(ids)
			XCTAssertEqual(
				missing.count, 0,
				"Missing '\(locale)' translations: \(missing)"
			)
			let extraneous = ids.subtracting(baseTranslationIds)
			XCTAssertEqual(
				extraneous.count, 0,
				"Extraneous '\(locale)' translations: \(extraneous)"
			)
		}
	}
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		XCTAssertThrowsError(
			try Feature(id: "unknown", kind: .element).localized(locale: .en),
			"Place element with id 'unknown' is not invalid"
		)
	}
	
}
