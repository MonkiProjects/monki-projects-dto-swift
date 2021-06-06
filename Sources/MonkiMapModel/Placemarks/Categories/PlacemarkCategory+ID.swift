//
//  PlacemarkCategory+ID.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 06/06/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Placemark.Category {
	
	/// The category of a placemark.
	/// It impacts its color and/or shape on the map.
	public enum ID: String, Codable, Hashable, Identifiable, DefaultCaseDecodable {
		
		case unknown
		case spot
		case facility
		case miscellaneous = "misc"
		
		public static var defaultCase: Self = .unknown
		
		public var id: RawValue { self.rawValue }
		
		public init(for kindId: Placemark.Kind.ID) {
			do {
				self = try kindId.internal(in: Locale.en).category
			} catch {
				self = .unknown
			}
		}
		
	}
	
}

/// Extend for testing purposes
extension Placemark.Category.ID: CaseIterable {}
