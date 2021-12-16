//
//  Place+Public.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsDTO

extension Place {
	
	/// Model of a place used in APIs responses.
	public struct Public: Hashable, Identifiable {
		
		public let id: Place.ID
		public var name: Place.Name?
		public var coordinate: Coordinate?
		public var kind: Place.Kind.ID?
		public var category: Place.Category.ID?
		public var details: Place.Details.Public
		public var metadata: Place.Metadata
		
		public init(
			id: Place.ID = .init(),
			name: Place.Name? = nil,
			coordinate: Coordinate? = nil,
			kind: Place.Kind.ID? = nil,
			category: Place.Category.ID? = nil,
			details: Place.Details.Public = .init(),
			metadata: Place.Metadata = .init()
		) {
			self.id = id
			self.name = name
			self.coordinate = coordinate
			self.kind = kind
			self.category = category
			self.details = details
			self.metadata = metadata
		}
		
	}
	
}

extension Place.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, name
		case coordinate
		case kind, category
		case details, metadata
	}
	
}
