//
//  PlacemarkAnnotationModel.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 02/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public struct PlacemarkAnnotationModel: Hashable, Identifiable {
	
	public let id: Placemark.ID
	public var name: Placemark.Name
	public var latitude: Latitude
	public var longitude: Longitude
	public var state: Placemark.State
	public var kind: Placemark.Kind.ID
	public var category: Placemark.Category.ID
	/// Used to update data client-side
	public var updatedAt: Date
	
	public init(
		id: Placemark.ID = .init(),
		name: Placemark.Name,
		latitude: Latitude,
		longitude: Longitude,
		state: Placemark.State = .local,
		kind: Placemark.Kind.ID = .defaultCase,
		category: Placemark.Category.ID = .defaultCase,
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

extension PlacemarkAnnotationModel: PlacemarkProtocol {
	
	public var kindId: Placemark.Kind.ID { kind }
	public var categoryId: Placemark.Category.ID { category }
	
}

extension PlacemarkAnnotationModel: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case name
		case latitude, longitude
		case state
		case kind, category
		case updatedAt = "updated_at"
	}
	
}
