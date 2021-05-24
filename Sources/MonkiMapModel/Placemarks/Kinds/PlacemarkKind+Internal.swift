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
	///     <key>good_for_training</key>
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
	struct Internal: Hashable, Identifiable, PlistDecodable {
		
		typealias Property = Placemark.Property
		
		static let fileName = "PlacemarkKinds"
		
		let id: Placemark.Kind
		let title: String
		let category: Placemark.Category
		private let features, goodForTraining, benefits, hazards: [String]
		
		var allowedFeatures: [Property] {
			features.map(Property.feature)
		}
		
		var allowedTechniques: [Property] {
			goodForTraining.map(Property.technique)
		}
		
		var allowedBenefits: [Property] {
			benefits.map(Property.benefit)
		}
		
		var allowedHazards: [Property] {
			hazards.map(Property.hazard)
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

extension Placemark.Kind.Internal: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case title, category
		case features
		case goodForTraining = "good_for_training"
		case benefits
		case hazards
	}
	
}
