//
//  PlacemarkCategory+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Category {
	
	/// A localized `Placemark.Category`.
	/// It's used by APIs to return localized content.
	///
	/// # Example #
	/// ```json
	/// {
	///     "id": "spot",
	///     "title": "Spot"
	/// }
	/// ```
	struct Localized: Hashable, Identifiable {
		
		public let id: Placemark.Category
		public let title: String
		
		fileprivate init(id: Placemark.Category, title: String) {
			self.id = id
			self.title = title
		}
		
	}
	
	func localized(in locale: Locale? = nil) throws -> Localized {
		let locale = locale ?? .default
		return Localized(id: self, title: try self.title(in: locale))
	}
	
}

extension Placemark.Category.Localized: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, title
	}
	
}
