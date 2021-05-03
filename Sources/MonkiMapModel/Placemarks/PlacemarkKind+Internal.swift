//
//  PlacemarkKind+Internal.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Kind {
	
	/// The internal structure of `Placemark.Kind`.
	/// It's used in localized `.plist` files.
	///
	/// # Example #
	/// ```xml
	/// <dict>
	///     <key>id</key>
	///     <string>training_spot</string>
	///     <key>title</key>
	///     <string>Training Spot</string>
	///     <key>category</key>
	///     <string>spot</string>
	///     <key>features</key>
	///     <array>
	///         <string>small_wall</string>
	///         <string>medium_wall</string>
	///     </array>
	///     <key>goodForTraining</key>
	///     <array>
	///         <string>precision_jump</string>
	///         <string>kong</string>
	///     </array>
	///     <key>benefits</key>
	///     <array>
	///         <string>drinking_fountain</string>
	///         <string>covered_area</string>
	///     </array>
	///     <key>hazards</key>
	///     <array>
	///         <string>security</string>
	///         <string>security_cam</string>
	///     </array>
	/// </dict>
	/// ```
	struct Internal: Codable, Hashable, Identifiable, PlistDecodable {
		
		typealias Property = Placemark.Property
		
		static let fileName = "PlacemarkKinds"
		
		let id: Placemark.Kind
		let title: String
		let category: Placemark.Category
		private let features, goodForTraining, benefits, hazards: [String]
		
		var allowedFeatures: [Property] {
			return features.map(Property.feature)
		}
		
		var allowedTechniques: [Property] {
			return goodForTraining.map(Property.technique)
		}
		
		var allowedBenefits: [Property] {
			return benefits.map(Property.benefit)
		}
		
		var allowedHazards: [Property] {
			return hazards.map(Property.hazard)
		}
		
	}
	
	func `internal`(in locale: Locale? = nil) throws -> Internal {
		let locale = locale ?? .default
		let values = Internal.all(in: locale)
		guard let first = values.first(where: { $0.id == self }) else {
			throw CustomError(
				reason: "Could not find a '\(Self.self)' in locale '\(locale)' with id '\(self.rawValue)'."
			)
		}
		return first
	}
	
	func title(in locale: Locale? = nil) throws -> String {
		let locale = locale ?? .default
		return try self == .unknown
			? Strings.unknown(in: locale)
			: self.internal(in: locale).title
	}
	
}
