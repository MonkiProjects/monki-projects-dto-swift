//
//  User+Public.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 08/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public protocol UserPublicSmallProtocol {
	var id: UUID { get }
	var username: String { get set }
	var displayName: String { get set }
	var avatar: AvatarSource? { get set }
	var country: String? { get set }
	var kind: User.Kind { get }
	var updatedAt: Date { get set }
}

public protocol UserPublicFullProtocol: UserPublicSmallProtocol {
	var details: User.Details { get set }
}

extension User {
	
	public enum Public {
		
		public struct Small: Codable, Hashable, Identifiable, UserPublicSmallProtocol {
			
			public let id: UUID
			public var username, displayName: String
			public var avatar: AvatarSource?
			public var country: String?
			public let kind: User.Kind
			public var updatedAt: Date
			
			public init(
				id: ID = UUID(),
				username: String,
				displayName: String,
				avatar: AvatarSource? = nil,
				country: String? = nil,
				kind: User.Kind = .user,
				updatedAt: Date = Date()
			) {
				self.id = id
				self.username = username
				self.displayName = displayName
				self.avatar = avatar
				self.country = country
				self.kind = kind
				self.updatedAt = updatedAt
			}
			
		}
		
		public struct Full: Codable, Hashable, Identifiable, UserPublicFullProtocol {
			
			public let id: UUID
			public var username, displayName: String
			public var avatar: AvatarSource?
			public var country: String?
			public let kind: User.Kind
			public var updatedAt: Date
			
			public var details: Details
			
			public init(
				id: ID = UUID(),
				username: String,
				displayName: String,
				avatar: AvatarSource? = nil,
				country: String? = nil,
				kind: User.Kind = .user,
				updatedAt: Date = Date(),
				details: Details = Details()
			) {
				self.id = id
				self.username = username
				self.displayName = displayName
				self.avatar = avatar
				self.country = country
				self.kind = kind
				self.updatedAt = updatedAt
				
				self.details = details
			}
			
			public init(
				_ small: UserPublicSmallProtocol,
				with details: Details = Details()
			) {
				self.init(
					id: small.id,
					username: small.username,
					displayName: small.displayName,
					avatar: small.avatar,
					country: small.country,
					kind: small.kind,
					updatedAt: small.updatedAt,
					details: details
				)
			}
			
		}
		
	}
	
}
