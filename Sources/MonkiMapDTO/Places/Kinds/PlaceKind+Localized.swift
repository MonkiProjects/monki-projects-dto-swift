//
//  PlaceKind+Localized.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Kind.DTO {
	
	/// A localized `Place.Kind`.
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
	public struct Localized: Hashable, Identifiable {
		
		public let id: Place.Kind.ID
		public let title: Place.Kind.Title
		
		fileprivate init(id: ID, title: Place.Kind.Title) {
			self.id = id
			self.title = title
		}
		
	}
	
}

extension Place.Kind.DTO.Localized: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, title
	}
	
}

extension Place.Kind.ID {
	
	public func localized(in locale: Locale? = nil) throws -> Place.Kind.DTO.Localized {
		let locale = locale ?? .default
		return Place.Kind.DTO.Localized(id: self, title: try self.title(in: locale))
	}
	
}
