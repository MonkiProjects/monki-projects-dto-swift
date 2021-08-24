//
//  Place+Draft.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/08/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Place {
	
	/// Model of a place when it's still being created.
	public struct Draft: Hashable, Identifiable {
		
		public let id: Place.ID
		public var name: Place.Name?
		public var aliases: [Place.Name]
		public var coordinate: Coordinate?
		public var kind: Place.Kind.ID?
		public var category: Place.Category.ID?
		public var details: Place.Details.Public
		public var metadata: Place.Metadata
		
		public init(
			id: Place.ID = .init(),
			name: Place.Name? = nil,
			aliases: [Place.Name] = .init(),
			coordinate: Coordinate? = nil,
			kind: Place.Kind.ID? = nil,
			category: Place.Category.ID? = nil,
			details: Place.Details.Public = .init(),
			metadata: Place.Metadata = .init()
		) {
			self.id = id
			self.name = name
			self.aliases = aliases
			self.coordinate = coordinate
			self.kind = kind
			self.category = category
			self.details = details
			self.metadata = metadata
		}
		
	}
	
}

extension Place.Draft: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, name, aliases
		case coordinate
		case kind, category
		case details, metadata
	}
	
}
