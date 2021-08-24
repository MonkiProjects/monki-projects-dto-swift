//
//  PlaceAnnotationModel.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 02/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public struct PlaceAnnotationModel: Hashable, Identifiable {
	
	public let id: Place.ID
	public var name: Place.Name
	public var coordinate: Coordinate
	public var isDraft: Bool
	public var kind: Place.Kind.ID
	public var category: Place.Category.ID
	
	public init(
		id: Place.ID = .init(),
		name: Place.Name,
		coordinate: Coordinate,
		isDraft: Bool,
		kind: Place.Kind.ID = .defaultCase,
		category: Place.Category.ID = .defaultCase
	) {
		self.id = id
		self.name = name
		self.coordinate = coordinate
		self.isDraft = isDraft
		self.kind = kind
		self.category = category
	}
	
}

extension PlaceAnnotationModel: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, name
		case coordinate
		case isDraft = "is_draft"
		case kind, category
	}
	
}
