//
//  PlacemarkCategory+Internal.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Category {
	
	/// The internal structure of `Placemark.Category`.
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
		
		static let fileName = "PlacemarkCategories"
		
		let id: Placemark.Category.ID
		let title: Placemark.Category.Title
		
	}
	
}

extension Placemark.Category.ID {
	
	func `internal`(in locale: Locale? = nil) throws -> Placemark.Category.Internal {
		let locale = locale ?? .default
		let values = Placemark.Category.Internal.all(in: locale)
		guard let first = values.first(where: { $0.id == self }) else {
			throw CustomError(
				reason: "Could not find a '\(Self.self)' in locale '\(locale)' with id '\(self.rawValue)'."
			)
		}
		return first
	}
	
	func title(in locale: Locale? = nil) throws -> Placemark.Category.Title {
		let locale = locale ?? .default
		return try self == .unknown
			? Strings.unknown(in: locale)
			: self.internal(in: locale).title
	}
	
}

extension Placemark.Category.Internal: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, title
	}
	
}
