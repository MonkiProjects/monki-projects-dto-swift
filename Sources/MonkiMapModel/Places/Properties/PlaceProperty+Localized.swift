//
//  PlaceProperty+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Property {
	
	/// A localized `Place.Property`.
	/// It's used by APIs to return localized content.
	///
	/// # Example
	///
	/// ```json
	/// {
	///     "id": "small_wall",
	///     "title": "Small Wall",
	///     "kind": "feature"
	/// }
	/// ```
	public struct Localized: Hashable, Identifiable {
		
		public let id: Place.Property.ID
		public let title: Place.Property.Title
		public let kind: Place.Property.Kind.ID
		
		fileprivate init(
			id: Place.Property.ID,
			title: Place.Property.Title,
			kind: Place.Property.Kind.ID
		) {
			// No need to check id, it comes from enum cases
			self.id = id
			self.title = title
			self.kind = kind
		}
		
	}
	
	internal func `internal`(in locale: Locale? = nil) throws -> Self.Internal {
		let locale = locale ?? .default
		return try Self.Internal.all(in: locale)
			.first(where: { $0.id == self.id && $0.kind == self.kind })
			.require()
	}
	
	public func title(in locale: Locale? = nil) throws -> Self.Title {
		let locale = locale ?? .default
		return try self.id == "unknown" // Unsafe but we cannot use .unknown here
			? Strings.unknown(in: locale)
			: self.internal(in: locale).title
	}
	
	public func localized(in locale: Locale? = nil) throws -> Self.Localized {
		let locale = locale ?? .default
		return Self.Localized(id: self.id, title: try self.title(in: locale), kind: self.kind)
	}
	
}

extension Place.Property.Localized: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, title, kind
	}
	
}
