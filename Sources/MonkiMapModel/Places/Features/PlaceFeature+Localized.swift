//
//  PlaceFeature+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 18/11/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

// MARK: - Models

extension Place.Feature.DTO {
	
	public struct Localized: Identifiable, Hashable, PlaceFeatureWithIcon {
		
		public typealias ID = Place.Feature.ID
		
		public let id: ID
		public let kind: Place.Feature.Kind
		public let isSystemDefined: Bool
		public var iconUrl: URL?
		
		public var label: String?
		public let locale: Locale
		
		public var labelOrId: String { label ?? id }
		
		public init(
			id: ID,
			kind: Place.Feature.Kind,
			isSystemDefined: Bool = false,
			iconUrl: URL? = nil,
			label: String? = nil,
			locale: Locale
		) {
			self.id = id
			self.kind = kind
			self.isSystemDefined = isSystemDefined
			self.iconUrl = iconUrl
			self.label = label
			self.locale = locale
		}
		
	}
	
}

extension Place.Feature {
	
	public func localized(locale: Locale? = nil) throws -> Self.DTO.Localized {
		return try self.internal(locale: locale)
	}
	
}

extension Place.Feature.Kind.DTO {
	
	public struct Localized: Identifiable, Hashable {
		
		public typealias ID = Place.Feature.Kind
		
		public let id: ID
		public let label: String?
		public let sectionTitle: String?
		public let locale: Locale
		
		public var labelOrId: String { label ?? id.rawValue }
		public var sectionTitleOrLabelOrId: String { sectionTitle ?? labelOrId }
		
		public init(
			id: ID,
			label: String? = nil,
			sectionTitle: String? = nil,
			locale: Locale
		) {
			self.id = id
			self.label = label
			self.sectionTitle = sectionTitle
			self.locale = locale
		}
		
	}
	
}

extension Place.Feature.Kind {
	
	public func localized(locale: Locale? = nil) throws -> Self.DTO.Localized {
		return try self.internal(locale: locale)
	}
	
}

// MARK: - Codable conformances

extension Place.Feature.DTO.Localized: Codable {
	
	enum CodingKeys: String, CodingKey {
		case id
		case kind
		case isSystemDefined = "system_defined"
		case iconUrl = "icon_url"
		case label
		case locale = "lang"
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.id 				= try container.decode(ID.self, forKey: .id)
		self.label 				= try container.decodeIfPresent(String.self, forKey: .label)
		self.kind 				= try container.decode(Place.Feature.Kind.self, forKey: .kind)
		self.isSystemDefined 	= try container.decodeIfPresent(Bool.self, forKey: .isSystemDefined) ?? false
		self.iconUrl 			= try container.decodeIfPresent(URL.self, forKey: .iconUrl)
		self.locale 			= Locale(identifier: try container.decode(String.self, forKey: .locale))
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(self.id, forKey: .id)
		try container.encodeIfPresent(self.label, forKey: .label)
		try container.encode(self.kind, forKey: .kind)
		if self.isSystemDefined {
			try container.encode(true, forKey: .isSystemDefined)
		}
		try container.encodeIfPresent(self.iconUrl, forKey: .iconUrl)
		try container.encode(self.locale.identifier, forKey: .locale)
	}
	
}

extension Place.Feature.Kind.DTO.Localized: Codable {
	
	enum CodingKeys: String, CodingKey {
		case id, label
		case sectionTitle = "section_title"
		case locale = "lang"
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.id 			= try container.decode(ID.self, forKey: .id)
		self.label 			= try container.decodeIfPresent(String.self, forKey: .label)
		self.sectionTitle 	= try container.decodeIfPresent(String.self, forKey: .sectionTitle)
		self.locale 		= Locale(identifier: try container.decode(String.self, forKey: .locale))
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(self.id, forKey: .id)
		try container.encodeIfPresent(self.label, forKey: .label)
		try container.encodeIfPresent(self.sectionTitle, forKey: .sectionTitle)
		try container.encode(self.locale.identifier, forKey: .locale)
	}
	
}

// MARK: - Comparators

public struct PlaceFeatureKindLocalizedComparator: SortComparator {
	
	public typealias Compared = Place.Feature.Kind.DTO.Localized
	
	public var order: SortOrder
	
	public func compare(_ lhs: Compared, _ rhs: Compared) -> ComparisonResult {
		PlaceFeatureKindComparator(order: order).compare(lhs.id, rhs.id)
	}
	
}

public struct DictionaryByPlaceFeatureKindComparator<T>: SortComparator {
	
	public typealias Compared = Dictionary<Place.Feature.Kind.DTO.Localized, T>.Element
	
	public var order: SortOrder
	
	public func compare(_ lhs: Compared, _ rhs: Compared) -> ComparisonResult {
		return PlaceFeatureKindLocalizedComparator(order: order).compare(lhs.key, rhs.key)
	}
	
}
