//
//  PlacemarkAnnotationModel.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 02/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public struct PlacemarkAnnotationModel: Codable, Hashable, Identifiable {
	
	public let id: UUID
	public var title: String
	public var latitude, longitude: Double
	public var state: Placemark.State
	public var kind: Placemark.Kind
	public var category: Placemark.Category
	/// Used to update data client-side
	public var updatedAt: Date
	
	public init(
		id: UUID = UUID(),
		title: String,
		latitude: Double,
		longitude: Double,
		state: Placemark.State = .local,
		kind: Placemark.Kind = .defaultCase,
		category: Placemark.Category = .defaultCase,
		updatedAt: Date = Date()
	) {
		self.id = id
		self.title = title
		self.latitude = latitude
		self.longitude = longitude
		self.state = state
		self.kind = kind
		self.category = category
		self.updatedAt = updatedAt
	}
	
}

extension PlacemarkAnnotationModel: PlacemarkProtocol {
	
	public var kindId: Placemark.Kind { kind }
	public var categoryId: Placemark.Category { category }
	
}
