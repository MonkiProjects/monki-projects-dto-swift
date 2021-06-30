//
//  PlacePropertyKind+ID.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 06/06/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Property.Kind {
	
	/// The kind of a place property.
	public enum ID: String, Codable, Hashable {
		
		/// A feature you might find on a place.
		case feature
		
		/// A technique one could train on a place.
		case technique
		
		/// A benefit some place could have.
		case benefit
		
		/// A hazard you might encounter on a place.
		case hazard
		
	}
	
}

/// Extend for testing purposes
extension Place.Property.Kind.ID: CaseIterable {}
