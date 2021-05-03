//
//  PlacemarkProperty+Kind.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Property {
	
	/// The kind of a placemark property.
	public enum Kind: String, Codable, Hashable, CaseIterable {
		
		/// A feature you might find on a placemark.
		case feature
		
		/// A technique one could train on a placemark.
		case technique
		
		/// A benefit some placemark could have.
		case benefit
		
		/// A hazard you might encounter on a placemark.
		case hazard
		
	}
	
	static func feature(_ feature: ID) -> Self {
		.init(id: feature, kind: .feature)
	}
	
	static func technique(_ technique: ID) -> Self {
		.init(id: technique, kind: .technique)
	}
	
	static func benefit(_ benefit: ID) -> Self {
		.init(id: benefit, kind: .benefit)
	}
	
	static func hazard(_ hazard: ID) -> Self {
		.init(id: hazard, kind: .hazard)
	}
	
}
