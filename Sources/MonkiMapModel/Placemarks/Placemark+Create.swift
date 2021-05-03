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
	
	public struct Create: Codable, Hashable {
		
		public var name: String
		public var latitude, longitude: Double
		public var kind: Kind
		public var caption: String
		public var images: [URL]?
		@RawKeyedCodableDictionary
		public var properties: [Property.Kind: [String]]
		
		public init(
			name: String = "",
			latitude: Double,
			longitude: Double,
			kind: Kind,
			caption: String = "",
			images: [URL]? = nil,
			properties: [Property.Kind: [String]] = [:]
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
