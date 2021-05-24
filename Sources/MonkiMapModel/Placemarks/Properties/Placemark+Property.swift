//
//  Placemark+Property.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Placemark {
	
	// A property a placemark could have
	public struct Property: Codable, Hashable, Identifiable {
		
		public enum CodingKeys: String, CodingKey {
			case kind, id
		}
		
		public let kind: Kind
		public let id: String
		
		public init(kind: Kind, id: String) {
			self.kind = kind
			self.id = id
		}
		
	}
	
}
