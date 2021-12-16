//
//  SportTests.swift
//  MonkiProjectsDTOTests
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiProjectsDTO

internal final class SportTests: XCTestCase {
	
	private let translations: [Sport: String] = [
		.parkour: "Parkour / AOM",
		.freerunning: "Freerunning",
		.tricking: "Tricking",
		.chaseTag: "Chase Tag",
		.ninjaWarrior: "Ninja Warrior",
		.bouldering: "Bouldering",
		.gymnastics: "Gymnastics",
	]
	
	func testDefaultTranslation() {
		XCTAssert(
			Sport.allCases.allSatisfy({ translations[$0] != nil }),
			"Missing key in Dictionary"
		)
		
		for (sport, name) in translations {
			XCTAssertEqual(sport.name, name)
		}
	}
	
}
