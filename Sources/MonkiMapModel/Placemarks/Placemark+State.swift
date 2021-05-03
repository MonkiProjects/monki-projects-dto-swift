//
//  Placemark+State.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public extension Placemark {
	
	// The state in which a placemark is.
	enum State: String, Hashable, Codable, DefaultCaseDecodable {
		
		public static var defaultCase: Self = .unknown
		
		// Special case reserved for backwards compatibility
		case unknown
		
		// State of a placemark created by a user but without enough data to show it on a map.
		case draft
		
		// State of a placemark that is stored locally on a user's device.
		case local
		
		// State of a placemark stored online but not visible to anyone.
		case `private`
		
		// State of a placemark submitted but not yet accepted or rejected.
		case submitted
		
		// State of a placemark accepted during its submission process.
		case published
		
		// State of a placemark rejected during its submission process.
		case rejected
		
		public var isLocal: Bool {
			return [.draft, .local].contains(self)
		}
		
	}
	
}

/// Extend for testing purposes
extension Placemark.State: CaseIterable {}
