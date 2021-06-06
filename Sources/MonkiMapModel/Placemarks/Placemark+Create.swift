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
		
		public var name: Placemark.Name
		public var latitude: Latitude
		public var longitude: Longitude
		public var kind: Kind
		public var caption: Placemark.Caption
		public var images: [URL]
		public var properties: [Property]
		
		public init(
			name: Placemark.Name = .init(),
			latitude: Latitude,
			longitude: Longitude,
			kind: Kind,
			caption: Placemark.Caption = .init(),
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

extension Placemark.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case name
		case latitude, longitude
		case kind
		case caption, images, properties
	}
	
}
