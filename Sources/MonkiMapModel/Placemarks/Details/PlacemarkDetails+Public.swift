//
//  PlacemarkDetails+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Placemark.Details {
	
	public struct Public: Codable, Hashable {
		
		public let caption: String
		public let satelliteImage: URL
		public let images: [URL]
		public let location: Placemark.Location.Public?
		public var properties: [Placemark.Property.Localized]
		
		public var allImages: [URL] { images + [satelliteImage] }
		
		public init(
			caption: String,
			satelliteImage: URL,
			images: [URL] = [],
			location: Placemark.Location.Public? = nil,
			properties: [Placemark.Property.Localized]
		) {
			self.caption = caption
			self.satelliteImage = satelliteImage
			self.images = images
			self.location = location
			self.properties = properties
		}
		
	}
	
}
