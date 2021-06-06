//
//  PlacemarkKind+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Kind {
	
	/// A localized `Placemark.Kind`.
	/// It's used by APIs to return localized content.
	///
	/// # Example
	///
	/// ```json
	/// {
	///     "id": "training_spot",
	///     "title": "Training Spot"
	/// }
	/// ```
	struct Localized: Hashable, Identifiable {
		
		public let id: Placemark.Kind.ID
		public let title: Placemark.Kind.Title
		
		fileprivate init(id: Placemark.Kind.ID, title: Placemark.Kind.Title) {
			self.id = id
			self.title = title
		}
		
	}
	
}

extension Placemark.Kind.ID {
	
	func localized(in locale: Locale? = nil) throws -> Placemark.Kind.Localized {
		let locale = locale ?? .default
		return Placemark.Kind.Localized(id: self, title: try self.title(in: locale))
	}
	
}

extension Placemark.Kind.Localized: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, title
	}
	
}
