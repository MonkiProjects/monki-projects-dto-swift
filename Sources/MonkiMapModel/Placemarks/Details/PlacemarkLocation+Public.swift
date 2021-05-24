//
//  PlacemarkLocation+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Location {
	
	public struct Public: Codable, Hashable {
		
		public enum CodingKeys: String, CodingKey {
			case city, country
		}
		
		public let city, country: String
		
		public init(city: String, country: String) {
			self.city = city
			self.country = country
		}
		
	}
	
}
