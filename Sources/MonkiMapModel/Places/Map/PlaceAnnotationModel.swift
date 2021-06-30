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
	public var latitude: Latitude
	public var longitude: Longitude
	public var state: Place.State
	public var kind: Place.Kind.ID
	public var category: Place.Category.ID
	/// Used to update data client-side
	public var updatedAt: Date
	
	public init(
		id: Place.ID = .init(),
		name: Place.Name,
		latitude: Latitude,
		longitude: Longitude,
		state: Place.State = .local,
		kind: Place.Kind.ID = .defaultCase,
		category: Place.Category.ID = .defaultCase,
		updatedAt: Date = .init()
	) {
		self.id = id
		self.name = name
		self.latitude = latitude
		self.longitude = longitude
		self.state = state
		self.kind = kind
		self.category = category
		self.updatedAt = updatedAt
	}
	
}

extension PlaceAnnotationModel: PlaceProtocol {
	
	public var kindId: Place.Kind.ID { kind }
	public var categoryId: Place.Category.ID { category }
	
}

extension PlaceAnnotationModel: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case name
		case latitude, longitude
		case state
		case kind, category
		case updatedAt = "updated_at"
	}
	
}
