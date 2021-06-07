//
//  Placemark+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Placemark {
	
	/// Model of a placemark used in APIs responses.
	public struct Public: Hashable, Identifiable {
		
		public let id: Placemark.ID
		public let name: Placemark.Name
		public let latitude: Latitude
		public let longitude: Longitude
		public let kind: Placemark.Kind.ID
		public let category: Placemark.Category.ID
		public let state: Placemark.State
		public let creator: User.ID
		public let details: Placemark.Details.Public
		public let createdAt, updatedAt: Date
		
		public init(
			id: Placemark.ID,
			name: Placemark.Name,
			latitude: Latitude,
			longitude: Longitude,
			kind: Placemark.Kind.ID,
			category: Placemark.Category.ID,
			state: Placemark.State,
			creator: User.ID,
			details: Placemark.Details.Public,
			createdAt: Date,
			updatedAt: Date
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
