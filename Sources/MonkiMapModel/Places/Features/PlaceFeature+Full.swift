//
//  PlaceFeature+Full.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 12/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

// MARK: - Models

extension Place.Feature.DTO {
	
	public struct Full: Identifiable, Hashable, PlaceFeatureWithIcon {
		
		public typealias ID = String
		
		public let id: ID
		public let kind: Place.Feature.Kind
		public let isSystemDefined: Bool
		public var iconUrl: URL?
		
		public init(
			id: ID,
			kind: Place.Feature.Kind,
			isSystemDefined: Bool = false,
			iconUrl: URL? = nil
		) {
			self.id = id
			self.kind = kind
			self.isSystemDefined = isSystemDefined
			self.iconUrl = iconUrl
		}
		
	}
	
}

// MARK: - Codable conformances

extension Place.Feature.DTO.Full: Codable {
	
	enum CodingKeys: String, CodingKey {
		case id
		case kind
		case isSystemDefined = "system_defined"
		case iconUrl = "icon_url"
	}
	
}
