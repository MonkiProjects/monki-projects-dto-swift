//
//  PlacemarkCategory+LocalizedTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkCategoryLocalizedTests: XCTestCase {
	
	typealias Category = Placemark.Category
	
	// MARK: - Valid Domain
	
	private let translations: [Locale: [Placemark.Category: String]] = [
		.en: [
			.unknown: "Unknown",
			.spot: "Spot",
			.facility: "Facility",
			.miscellaneous: "Miscellaneous",
		],
		.fr: [
			.unknown: "Inconnu",
			.spot: "Spot",
			.facility: "Salle",
			.miscellaneous: "Divers",
		],
	]
	
	func testTranslations() {
		for category in Category.allCases {
			for (locale, translations) in translations {
				XCTAssert(
					translations[category] != nil,
					"Missing key '\(category)' in '\(locale)' translations"
				)
			}
		}
		
		for (locale, translations) in translations {
			for (category, title) in translations {
				do {
					let expected = try category.title(in: locale)
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedCategoryHasCorrectTitle() throws {
		let id = Category.facility
		
		// Test English translation
		do {
			let result = try Category.facility.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Facility")
		}
		
		// Test French translation
		do {
			let result = try Category.facility.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Salle")
		}
	}
	
	func testAllEnumCasesExist() throws {
		for locale in Locale.supported {
			let localized = Category.Internal.all(in: locale)
			
			// Test will also fail if too many cases are defined
			XCTAssertEqual(
				localized.count,
				Category.allCases.count - 1, // - 1 because of .unknown case
				localized.filter({ $0.id == .unknown }).map(\.title).description
			)
		}
	}
	
	// MARK: - Invalid Domain
	
}
