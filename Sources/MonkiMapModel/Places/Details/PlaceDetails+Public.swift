//
//  PlaceDetails+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import Algorithms
import MonkiProjectsModel

extension Place.Details {
	
	public struct Public: Hashable {
		
		public var caption: Place.Caption?
		public var satelliteImage: ImageSource?
		public var images: [ImageSource]
		public var location: Place.Location.Public?
		public var features: [Place.Feature]
		public var aliases: [Place.Name]
		
		public var allImages: [ImageSource] { images + [satelliteImage].compacted() }
		
		public init(
			caption: Place.Caption? = nil,
			satelliteImage: ImageSource? = nil,
			images: [ImageSource] = .init(),
			location: Place.Location.Public? = nil,
			features: [Place.Feature] = .init(),
			aliases: [Place.Name] = .init()
		) {
			self.caption = caption
			self.satelliteImage = satelliteImage
			self.images = images
			self.location = location
			self.features = features
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
		case features
		case aliases
	}
	
}
