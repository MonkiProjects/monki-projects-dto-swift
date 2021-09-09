//
//  PlaceDetails+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Place.Details {
	
	public struct Public: Hashable {
		
		public var caption: Place.Caption
		public var satelliteImage: URL?
		public var images: [URL]
		public var location: Place.Location.Public?
		public var properties: [Place.Property.Localized]
		public var aliases: [Place.Name]
		
		public var allImages: [URL] { images + [satelliteImage].compactMap { $0 } }
		
		public init(
			caption: Place.Caption = "",
			satelliteImage: URL? = nil,
			images: [URL] = .init(),
			location: Place.Location.Public? = nil,
			properties: [Place.Property.Localized] = .init(),
			aliases: [Place.Name] = .init()
		) {
			self.caption = caption
			self.satelliteImage = satelliteImage
			self.images = images
			self.location = location
			self.properties = properties
			self.aliases = aliases
		}
		
	}
	
}

extension Place.Details.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case caption
		case satelliteImage = "satellite_image"
		case images
		case location
		case properties
		case aliases
	}
	
}
