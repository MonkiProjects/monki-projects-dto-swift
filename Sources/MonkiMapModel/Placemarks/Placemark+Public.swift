//
//  Placemark+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
#if canImport(CoreLocation)
import CoreLocation
#endif
import MonkiProjectsModel

extension Placemark {
	
	/// Model of a placemark used in APIs responses.
	public struct Public: Hashable, Identifiable {
		
		public let id: Placemark.ID
		public var name: Placemark.Name
		public var latitude: Latitude
		public var longitude: Longitude
		public var kind: Placemark.Kind.ID
		public var category: Placemark.Category.ID
		public var state: Placemark.State
		public let creator: User.ID
		public var details: Placemark.Details.Public
		public let createdAt: Date
		public var updatedAt: Date
		
		#if canImport(CoreLocation)
		public var coordinates: CLLocationCoordinate2D {
			return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
		}
		#endif
		
		public init(
			id: Placemark.ID = .init(),
			name: Placemark.Name,
			latitude: Latitude,
			longitude: Longitude,
			kind: Placemark.Kind.ID = .trainingSpot,
			category: Placemark.Category.ID = .spot,
			state: Placemark.State = .draft,
			creator: User.ID,
			details: Placemark.Details.Public,
			createdAt: Date = .init(),
			updatedAt: Date = .init()
		) {
			self.id = id
			self.name = name
			self.latitude = latitude
			self.longitude = longitude
			self.kind = kind
			self.category = category
			self.state = state
			self.creator = creator
			self.details = details
			self.createdAt = createdAt
			self.updatedAt = updatedAt
		}
		
	}
	
}

extension Placemark.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case name
		case latitude, longitude
		case kind, category
		case state
		case creator
		case details
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
	
}
