//
//  PlaceCategory+Localized.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Category {
	
	/// A localized `Place.Category`.
	/// It's used by APIs to return localized content.
	///
	/// # Example
	///
	/// ```json
	/// {
	///     "id": "spot",
	///     "title": "Spot"
	/// }
	/// ```
	public struct Localized: Hashable, Identifiable {
		
		public let id: Place.Category.ID
		public let title: Place.Category.Title
		
		fileprivate init(id: Place.Category.ID, title: Place.Category.Title) {
			self.id = id
			self.title = title
		}
		
	}
	
}

extension Place.Category.ID {
	
	public func localized(in locale: Locale? = nil) throws -> Place.Category.Localized {
		let locale = locale ?? .default
		return Place.Category.Localized(id: self, title: try self.title(in: locale))
	}
	
}

extension Place.Category.Localized: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, title
	}
	
}
