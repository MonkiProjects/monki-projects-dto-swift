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
		
		public var caption: Place.Caption?
		public var satelliteImage: ImageSource?
		public var images: [ImageSource]
		public var location: Place.Location.Public?
		public var properties: [Place.Property]
		public var aliases: [Place.Name]
		
		public var allImages: [ImageSource] { images + [satelliteImage].compactMap { $0 } }
		
		public init(
			caption: Place.Caption? = nil,
			satelliteImage: ImageSource? = nil,
			images: [ImageSource] = .init(),
			location: Place.Location.Public? = nil,
			properties: [Place.Property] = .init(),
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
