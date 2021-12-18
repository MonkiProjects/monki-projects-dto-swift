//
//  Place+Create.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsDTO

extension Place.DTO {
	
	public struct Create: Hashable {
		
		public var id: Place.ID?
		public var name: Place.Name
		public var aliases: [Place.Name]
		public var coordinate: Coordinate
		public var kind: Place.Kind.ID
		public var caption: Place.Caption
		public var images: [URL]
		public var features: [Place.Feature]
		
		public init(
			id: Place.ID? = nil,
			name: Place.Name = .init(),
			aliases: [Place.Name] = .init(),
			coordinate: Coordinate,
			kind: Place.Kind.ID,
			caption: Place.Caption = .init(),
			images: [URL] = .init(),
			features: [Place.Feature] = .init()
		) {
			self.id = id
			self.name = name
			self.aliases = aliases
			self.coordinate = coordinate
			self.kind = kind
			self.caption = caption
			self.images = images
			self.features = features
		}
		
	}
	
}

// MARK: - Codable conformances

extension Place.DTO.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case name, aliases
		case coordinate
		case kind
		case caption, images, features
	}
	
}
