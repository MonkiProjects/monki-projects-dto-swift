//
//  PlacemarkProperty+LocalizedTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkPropertyLocalizedTests: XCTestCase {
	
	typealias Property = Placemark.Property
	
	// MARK: - Valid Domain
	
	func testLocalizedPropertyHasCorrectTitle() throws {
		let id = "small_wall"
		let property = Property.feature(id)
		
		// Test English translation
		do {
			let result = try property.localized(in: .en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Small Wall")
		}
		
		// Test French translation
		do {
			let result = try property.localized(in: .fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Petit mur")
		}
	}
	
	func testAllPropertiesAreTranslated() throws {
		var translations = [Locale: Set<String>]()
		for locale in Locale.supported {
			translations[locale] = Set(Property.Internal.all(in: locale).map(\.id))
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
	
}
