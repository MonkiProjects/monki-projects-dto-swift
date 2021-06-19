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
	
	public struct Public: Hashable {
		
		public var caption: Placemark.Caption
		public var satelliteImage: URL
		public var images: [URL]
		public var location: Placemark.Location.Public?
		public var properties: [Placemark.Property.Localized]
		
		public var allImages: [URL] { images + [satelliteImage] }
		
		public init(
			caption: Placemark.Caption,
			satelliteImage: URL,
			images: [URL] = .init(),
			location: Placemark.Location.Public? = nil,
			properties: [Placemark.Property.Localized] = .init()
		) {
			self.caption = caption
			self.satelliteImage = satelliteImage
			self.images = images
			self.location = location
			self.properties = properties
		}
		
	}
	
}

extension Placemark.Details.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case caption
		case satelliteImage = "satellite_image"
		case images
		case location
		case properties
	}
	
}
