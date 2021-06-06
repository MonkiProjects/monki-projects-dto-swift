//
//  PlacemarkPropertyKind+ID.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 06/06/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Property.Kind {
	
	/// The kind of a placemark property.
	public enum ID: String, Codable, Hashable {
		
		/// A feature you might find on a placemark.
		case feature
		
		/// A technique one could train on a placemark.
		case technique
		
		/// A benefit some placemark could have.
		case benefit
		
		/// A hazard you might encounter on a placemark.
		case hazard
		
	}
	
}

/// Extend for testing purposes
extension Placemark.Property.Kind.ID: CaseIterable {}
