//
//  PlacemarkLocation+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Location {
	
	public struct Public: Hashable {
		
		public var city: Placemark.City
		public var country: Placemark.Country
		
		public init(city: Placemark.City, country: Placemark.Country) {
			self.city = city
			self.country = country
		}
		
	}
	
}

extension Placemark.Location.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case city, country
	}
	
}
