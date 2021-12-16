//
//  PlaceKind+Internal.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Kind {
	
	/// The internal structure of `Place.Kind`.
	/// It's used in localized `.plist` files.
	///
	/// # Example
	///
	/// ```xml
	/// <dict>
	///     <key>id</key>
	///     <string>training_spot</string>
	///     <key>title</key>
	///     <string>Training Spot</string>
	///     <key>category</key>
	///     <string>spot</string>
	/// </dict>
	/// ```
	struct Internal: Codable, Hashable, Identifiable, PlistDecodable {
		
		static let fileName = "PlaceKinds"
		
		let id: Place.Kind.ID
		let title: Place.Kind.Title
		let category: Place.Category.ID
		
	}
	
}

extension Place.Kind.ID {
	
	internal func `internal`(in locale: Locale? = nil) throws -> Place.Kind.Internal {
		let locale = locale ?? .default
		let values = Place.Kind.Internal.all(in: locale)
		guard let first = values.first(where: { $0.id == self }) else {
			throw CustomError(
				reason: "Could not find a '\(Self.self)' in locale '\(locale)' with id '\(self.rawValue)'."
			)
		}
		return first
	}
	
	public func title(in locale: Locale? = nil) throws -> Place.Kind.Title {
		switch self {
		case .unknown:
			return try Strings.unknown(in: locale)
		default:
			let locale = locale ?? .default
			return try self.internal(in: locale).title
		}
	}
	
	public func optionalTitle(in locale: Locale? = nil) -> Place.Kind.Title? {
		return try? self.title(in: locale)
	}
	
}
