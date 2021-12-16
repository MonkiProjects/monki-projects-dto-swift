//
//  PlaceFeatureKindLocalisationTests.swift
//  MonkiMapDTOTests
//
//  Created by Rémi Bardon on 13/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapDTO

internal final class PlaceFeatureKindLocalisationTests: XCTestCase {
	
	private typealias Kind = Place.Feature.Kind
	
	// MARK: - Valid Domain
	
	func testLocalizedKindHasCorrectTitle() throws {
		let kind = Kind.element
		
		// Test English translation
		do {
			let result = try kind.localized(locale: .en)
			XCTAssertEqual(result.id, kind)
			XCTAssertEqual(result.label, "Element")
		}
		
		// Test French translation
		do {
			let result = try kind.localized(locale: .fr)
			XCTAssertEqual(result.id, kind)
			XCTAssertEqual(result.label, "Élément")
		}
	}
	
	func testAllFeaturesAreTranslated() throws {
		var translations = [Locale: Set<String>]()
		for locale in Locale.supported {
			translations[locale] = Set(Kind.DTO.Localized.all(locale: locale).map(\.id.rawValue))
		}
		
		let baseTranslationIds = try XCTUnwrap(translations.removeValue(forKey: .en))
		XCTAssertEqual(baseTranslationIds, Set(Kind.allCases.map(\.rawValue)))
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
	
}
