//
//  Place+Metadata.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/08/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Place {
	
	public struct Metadata: Hashable {
		
		public let creator: User.ID?
		public let createdAt: Date
		public var updatedAt: Date
		
		public init(
			creator: User.ID? = nil,
			createdAt: Date = .init(),
			updatedAt: Date = .init()
		) {
			self.creator = creator
			self.createdAt = createdAt
			self.updatedAt = updatedAt
		}
		
	}
	
}

extension Place.Metadata: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case creator
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
	
}
