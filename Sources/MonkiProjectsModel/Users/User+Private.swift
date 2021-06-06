//
//  User+Private.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 10/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	/// Private details about a user.
	public struct Private: Hashable, Identifiable, UserPublicFullProtocol {
		
		public let id: User.ID
		public var username: User.Username
		public var displayName: User.DisplayName
		public var avatar: AvatarSource?
		public var country: User.Country?
		public let kind: User.Kind
		public var updatedAt: Date
		
		public var details: Details
		
		public var email: Email
		
		public init(
			id: User.ID = .init(),
			username: User.Username,
			displayName: User.DisplayName,
			avatar: AvatarSource? = nil,
			country: User.Country? = nil,
			kind: User.Kind = .user,
			updatedAt: Date = .init(),
			details: Details = .init(),
			email: Email
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
			email: Email
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

extension User.Private: Codable {
	
	internal enum CodingKeys: String, CodingKey {
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
	
}
