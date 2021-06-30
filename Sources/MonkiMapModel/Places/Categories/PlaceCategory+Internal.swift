//
//  PlaceCategory+Internal.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Category {
	
	/// The internal structure of `Place.Category`.
	/// It's used in localized `.plist` files.
	///
	/// # Example #
	/// ```xml
	/// <dict>
	///     <key>id</key>
	///     <string>spot</string>
	///     <key>title</key>
	///     <string>Spot</string>
	/// </dict>
	/// ```
	struct Internal: Hashable, Identifiable, PlistDecodable {
		
		static let fileName = "PlaceCategories"
		
		let id: Place.Category.ID
		let title: Place.Category.Title
		
	}
	
}

extension Place.Category.ID {
	
	internal func `internal`(in locale: Locale? = nil) throws -> Place.Category.Internal {
		let locale = locale ?? .default
		let values = Place.Category.Internal.all(in: locale)
		guard let first = values.first(where: { $0.id == self }) else {
			throw CustomError(
				reason: "Could not find a '\(Self.self)' in locale '\(locale)' with id '\(self.rawValue)'."
			)
		}
		return first
	}
	
	public func title(in locale: Locale? = nil) throws -> Place.Category.Title {
		let locale = locale ?? .default
		return try self == .unknown
			? Strings.unknown(in: locale)
			: self.internal(in: locale).title
	}
	
}

extension Place.Category.Internal: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, title
	}
	
}
