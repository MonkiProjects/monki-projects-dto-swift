//
//  PlaceCategory+ID.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 06/06/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsDTO

extension Place.Category {
	
	/// The category of a place.
	/// It impacts its color and/or shape on the map.
	public enum ID: String, Codable, Hashable, Identifiable, CaseIterable, DefaultCaseDecodable {
		
		case unknown
		case spot
		case facility
		case miscellaneous = "misc"
		
		public static var defaultCase: Self = .unknown
		
		public var id: RawValue { self.rawValue }
		
	}
	
}

extension Place.Category.ID {
	
	public init(forKindId kindId: Place.Kind.ID) {
		do {
			self = try kindId.internal().category
		} catch {
			self = .unknown
		}
	}
	
}

extension Place.Kind.ID {
	
	public var category: Place.Category.ID { .init(forKindId: self) }
	
}
