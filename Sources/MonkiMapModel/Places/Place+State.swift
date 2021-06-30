//
//  Place+State.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Place {
	
	/// The state in which a place is.
	public enum State: String, Codable, Hashable, DefaultCaseDecodable {
		
		public static var defaultCase: Self = .unknown
		
		/// Special case reserved for backwards compatibility
		case unknown
		
		/// State of a place created by a user but without enough data to show it on a map.
		case draft
		
		/// State of a place that is stored locally on a user's device.
		case local
		
		/// State of a place stored online but not visible to anyone.
		case `private`
		
		/// State of a place submitted but not yet accepted or rejected.
		case submitted
		
		/// State of a place accepted during its submission process.
		case published
		
		/// State of a place rejected during its submission process.
		case rejected
		
		public var isLocal: Bool {
			[.draft, .local].contains(self)
		}
		
	}
	
}

/// Extend for testing purposes
extension Place.State: CaseIterable {}
