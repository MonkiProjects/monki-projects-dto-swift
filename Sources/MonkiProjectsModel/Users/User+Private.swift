//
//  User+Private.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 10/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct Private: Codable, Hashable, Identifiable, UserPublicFullProtocol {
		
		public enum CodingKeys: String, CodingKey {
			case id
			case username
			case displayName = "display_name"
			case avatar
			case country
			case kind
			case updatedAt = "updated_at"
			case details
			case email
		}
		
		public let id: UUID
		public var username, displayName: String
		public var avatar: AvatarSource?
		public var country: String?
		public let kind: User.Kind
		public var updatedAt: Date
		
		public var details: Details
		
		public var email: String
		
		public init(
			id: ID = UUID(),
			username: String,
			displayName: String,
			avatar: AvatarSource? = nil,
			country: String? = nil,
			kind: User.Kind = .user,
			updatedAt: Date = Date(),
			details: Details = Details(),
			email: String
		) {
			self.id = id
			self.username = username
			self.displayName = displayName
			self.avatar = avatar
			self.country = country
			self.kind = kind
			self.updatedAt = updatedAt
			self.details = details
			
			self.email = email
		}
		
		public init(
			_ full: UserPublicFullProtocol,
			email: String
		) {
			self.init(
				id: full.id,
				username: full.username,
				displayName: full.displayName,
				avatar: full.avatar,
				country: full.country,
				kind: full.kind,
				updatedAt: full.updatedAt,
				details: full.details,
				email: email
			)
		}
		
	}
	
}
