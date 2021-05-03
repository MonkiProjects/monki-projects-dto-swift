//
//  PlacemarkKind+LocalizedTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkKindLocalizedTests: XCTestCase {
	
	typealias Kind = Placemark.Kind
	
	// MARK: - Valid Domain
	
	private let translations: [Locale: [Kind: String]] = [
		.en: [
			.unknown: "Unknown",
			.trainingSpot: "Training Spot",
			.outdoorParkourPark: "Outdoor Parkour Park",
			.calisthenicsPark: "Calisthenics Park",
			.descent: "Descent",
			.urbanClimbingSpot: "Urban Climbing Spot",
			.playground: "Playground",
			.indoorParkourPark: "Indoor Parkour Park",
			.boulderingFacility: "Bouldering Facility",
			.aomAcademy: "Art Of Movement Academy",
			.trickingSchool: "Tricking School",
			.trampolinePark: "Trampoline Park",
			.gymnasticsGym: "Gymnastics Gym",
			.drinkingFountain: "Drinking Fountain",
			.bikeRental: "Bike Rental",
		],
		.fr: [
			.unknown: "Inconnu",
			.trainingSpot: "Lieu d'entraînement",
			.outdoorParkourPark: "Parkour park en extérieur",
			.calisthenicsPark: "Parc de street workout",
			.descent: "Descente",
			.urbanClimbingSpot: "Spot de grimpe urbaine",
			.playground: "Aire de jeu",
			.indoorParkourPark: "Parkour park en intérieur",
			.boulderingFacility: "Salle d'escalade",
			.aomAcademy: "Académie d'Art Du Déplacement",
			.trickingSchool: "École de tricking",
			.trampolinePark: "Trampoline Park",
			.gymnasticsGym: "Salle de gymnastique",
			.drinkingFountain: "Fontaine à eau potable",
			.bikeRental: "Location de vélos",
		],
	]
	
	func testTranslations() {
		for kind in Kind.allCases {
			for (locale, translations) in translations {
				XCTAssert(
					translations[kind] != nil,
					"Missing key '\(kind)' in '\(locale)' translations"
				)
			}
		}
		
		for (locale, translations) in translations {
			for (kind, title) in translations {
				do {
					let expected = try kind.title(in: locale)
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedTypeHasCorrectTitle() throws {
		let id = Kind.trainingSpot
		
		// Test English translation
		do {
			let result = try Kind.trainingSpot.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Training Spot")
		}
		
		// Test French translation
		do {
			let result = try Kind.trainingSpot.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Lieu d'entraînement")
		}
	}
	
	func testAllEnumCasesExist() throws {
		for locale in Locale.supported {
			let localized = Kind.Internal.all(in: locale)
			
			// Test will also fail if too many cases are defined
			XCTAssertEqual(
				localized.count,
				Kind.allCases.count - 1, // - 1 because of .unknown case
				localized.filter({ $0.id == .unknown }).map(\.title).description
			)
		}
	}
	
	// MARK: - Invalid Domain
	
}
