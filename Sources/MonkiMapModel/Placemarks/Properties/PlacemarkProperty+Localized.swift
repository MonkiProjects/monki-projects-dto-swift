//
//  PlacemarkProperty+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public extension Placemark.Property {
	
	/// A localized `Placemark.Property`.
	/// It's used by APIs to return localized content.
	///
	/// # Example #
	/// ```json
	/// {
	///     "id": "small_wall",
	///     "title": "Small Wall",
	///     "kind": "feature"
	/// }
	/// ```
	struct Localized: Codable, Hashable, Identifiable {
		
		public let id: String
		public let title: String
		public let kind: Kind
		
		fileprivate init(id: ID, title: String, kind: Kind) {
			// No need to check id, it comes from enum cases
			self.id = id
			self.title = title
			self.kind = kind
		}
		
	}
	
	internal func `internal`(in locale: Locale? = nil) throws -> Internal {
		let locale = locale ?? .default
		return try Internal.all(in: locale)
			.first(where: { $0.id == self.id && $0.kind == self.kind })
			.require()
	}
	
	func title(in locale: Locale? = nil) throws -> String {
		let locale = locale ?? .default
		return try self.id == "unknown" // Unsafe but we cannot use .unknown here
			? Strings.unknown(in: locale)
			: self.internal(in: locale).title
	}
	
	func localized(in locale: Locale? = nil) throws -> Localized {
		let locale = locale ?? .default
		return Localized(id: self.id, title: try self.title(in: locale), kind: self.kind)
	}
	
}
