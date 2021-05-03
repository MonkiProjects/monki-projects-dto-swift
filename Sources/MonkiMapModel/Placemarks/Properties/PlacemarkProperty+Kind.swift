//
//  PlacemarkProperty+Kind.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public extension Placemark.Property {
	
	/// The kind of a placemark property.
	enum Kind: String, Codable, Hashable, CaseIterable {
		
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
		return .init(id: feature, kind: .feature)
	}
	
	static func technique(_ technique: ID) -> Self {
		return .init(id: technique, kind: .technique)
	}
	
	static func benefit(_ benefit: ID) -> Self {
		return .init(id: benefit, kind: .benefit)
	}
	
	static func hazard(_ hazard: ID) -> Self {
		return .init(id: hazard, kind: .hazard)
	}
	
}
