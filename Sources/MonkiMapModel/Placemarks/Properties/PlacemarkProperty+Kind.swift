//
//  PlacemarkProperty+Kind.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Property {
	
	public enum Kind {}
	
	public static func feature(_ feature: Self.ID) -> Self {
		Self(kind: .feature, id: feature)
	}
	
	public static func technique(_ technique: Self.ID) -> Self {
		Self(kind: .technique, id: technique)
	}
	
	public static func benefit(_ benefit: Self.ID) -> Self {
		Self(kind: .benefit, id: benefit)
	}
	
	public static func hazard(_ hazard: Self.ID) -> Self {
		Self(kind: .hazard, id: hazard)
	}
	
}
