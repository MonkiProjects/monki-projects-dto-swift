//
//  Place+Property.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Place {
	
	// A property a place could have
	public struct Property: Hashable, Identifiable {
		
		public let kind: Self.Kind.ID
		public let id: Self.ID
		
		public init(kind: Self.Kind.ID, id: Self.ID) {
			self.kind = kind
			self.id = id
		}
		
	}
	
}

extension Place.Property: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case kind, id
	}
	
}
