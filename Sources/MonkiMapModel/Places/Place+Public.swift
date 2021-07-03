//
//  Place+Public.swift
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

extension Place {
	
	/// Model of a place used in APIs responses.
	public struct Public: Hashable, Identifiable {
		
		public let id: Place.ID
		public var name: Place.Name
		public var latitude: Latitude
		public var longitude: Longitude
		public var kind: Place.Kind.ID
		public var category: Place.Category.ID
		public var state: Place.State
		public let creator: User.ID
		public var details: Place.Details.Public
		public let createdAt: Date
		public var updatedAt: Date
		
		#if canImport(CoreLocation)
		public var coordinates: CLLocationCoordinate2D {
			get {
				CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
			}
			set {
				self.latitude = newValue.latitude
				self.longitude = newValue.longitude
			}
		}
		#endif
		
		public init(
			id: Place.ID = .init(),
			name: Place.Name,
			latitude: Latitude,
			longitude: Longitude,
			kind: Place.Kind.ID = .trainingSpot,
			category: Place.Category.ID = .spot,
			state: Place.State = .draft,
			creator: User.ID,
			details: Place.Details.Public,
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

extension Place.Public: Codable {
	
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
