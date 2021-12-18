//
//  Place+Metadata.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 24/08/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsDTO

extension Place.DTO {
	
	public struct Metadata: Hashable {
		
		public var visibility: Place.Visibility
		public var isDraft: Bool
		public let creator: User.ID?
		public let createdAt: Date
		public var updatedAt: Date
		
		public init(
			visibility: Place.Visibility = .private,
			isDraft: Bool = true,
			creator: User.ID? = nil,
			createdAt: Date = .init(),
			updatedAt: Date = .init()
		) {
			self.visibility = visibility
			self.isDraft = isDraft
			self.creator = creator
			self.createdAt = createdAt
			self.updatedAt = updatedAt
		}
		
	}
	
}

extension Place.DTO.Metadata: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case visibility
		case isDraft = "is_draft"
		case creator
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
	
}
