//
//  SocialNetworkTests.swift
//  MonkiProjectsModelTests
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiProjectsModel

internal final class SocialNetworkTests: XCTestCase {
	
	private let translations: [SocialNetwork: String] = [
		.instagram: "Instagram",
		.youTube: "YouTube",
		.vimeo: "Vimeo",
		.facebook: "Facebook",
		.twitter: "Twitter",
		.messenger: "Messenger",
		.tikTok: "TikTok",
	]
	
	func testDefaultTranslation() {
		XCTAssert(
			SocialNetwork.allCases.allSatisfy({ translations[$0] != nil }),
			"Missing key in Dictionary"
		)
		
		for (app, name) in translations {
			XCTAssertEqual(app.name, name)
		}
	}
	
	func testSortedOrder() {
		let expected: [SocialNetwork] = [.instagram, .youTube, .vimeo, .facebook, .twitter, .messenger, .tikTok]
		XCTAssertEqual(SocialNetwork.allCases.sorted(), expected)
	}
	
}
