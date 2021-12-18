//
//  PlaceLocation+Public.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Location.DTO {
	
	public struct Public: Hashable {
		
		public var city: Place.City
		public var country: Place.Country
		
		public init(city: Place.City, country: Place.Country) {
			self.city = city
			self.country = country
		}
		
	}
	
}

extension Place.Location.DTO.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case city, country
	}
	
}
