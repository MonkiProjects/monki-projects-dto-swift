//
//  Place+Create.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Place {
	
	public struct Create: Hashable {
		
		public var name: Place.Name
		public var latitude: Latitude
		public var longitude: Longitude
		public var kind: Place.Kind.ID
		public var caption: Place.Caption
		public var images: [URL]
		public var properties: [Property]
		
		public init(
			name: Place.Name = .init(),
			latitude: Latitude,
			longitude: Longitude,
			kind: Place.Kind.ID,
			caption: Place.Caption = .init(),
			images: [URL] = .init(),
			properties: [Property] = .init()
		) {
			self.name = name
			self.latitude = latitude
			self.longitude = longitude
			self.kind = kind
			self.caption = caption
			self.images = images
			self.properties = properties
		}
		
	}
	
}

extension Place.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case name
		case latitude, longitude
		case kind
		case caption, images, properties
	}
	
}
