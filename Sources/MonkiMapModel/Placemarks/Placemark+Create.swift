//
//  Placemark+Create.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Placemark {
	
	public struct Create: Hashable {
		
		public var name: String
		public var latitude, longitude: Double
		public var kind: Kind
		public var caption: String
		public var images: [URL]
		public var properties: [Property]
		
		public init(
			name: String = "",
			latitude: Double,
			longitude: Double,
			kind: Kind,
			caption: String = "",
			images: [URL] = [],
			properties: [Property] = []
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

extension Placemark.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case name
		case latitude, longitude
		case kind
		case caption, images, properties
	}
	
}
