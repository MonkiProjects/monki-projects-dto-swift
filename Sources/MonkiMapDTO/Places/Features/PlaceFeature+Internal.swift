//
//  PlaceFeature+Internal.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 08/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

// MARK: - Models

extension Place.Feature {
	
	internal typealias Internal = Place.Feature.DTO.Localized
	
	internal func `internal`(locale: Locale? = nil) throws -> Self.Internal {
		let locale = locale.orBestLanguage ?? .default
		let all = Self.Internal.all(locale: locale)
		
		guard let first = all.first(where: { $0.id == self.id && $0.kind == self.kind }) else {
			throw CustomError(
				reason: "Could not find a '\(Self.self)' in locale '\(locale)' with id '\(self.id)'."
			)
		}
		
		return first
	}
	
}

extension Place.Feature.Internal: JSONDecodable {
	
	static var fileName: String { "PlaceFeatures" }
	
}

extension Place.Feature.Kind {
	
	internal typealias Internal = Place.Feature.Kind.DTO.Localized
	
	internal func `internal`(locale: Locale? = nil) throws -> Self.Internal {
		let locale = locale.orBestLanguage ?? .default
		let all = Self.Internal.all(locale: locale)
		
		guard let first = all.first(where: { $0.id == self }) else {
			throw CustomError(
				reason: "Could not find a '\(Self.self)' in locale '\(locale)' with id '\(self)'."
			)
		}
		
		return first
	}
	
}

extension Place.Feature.Kind.Internal: JSONDecodable {
	
	static var fileName: String { "PlaceFeatureKinds" }
	
}
