//
//  PlaceKind+Internal.swift
//  MonkiMapModel
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
		
		typealias Property = Place.Property
		
		static let fileName = "PlaceKinds"
		
		let id: Place.Kind.ID
		let title: Place.Kind.Title
		let category: Place.Category.ID
		private let features, goodForTraining, benefits, hazards: [Property.ID]
		
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

extension Place.Kind.Internal: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case title, category
		case features
		case goodForTraining = "good_for_training"
		case benefits
		case hazards
	}
	
}
