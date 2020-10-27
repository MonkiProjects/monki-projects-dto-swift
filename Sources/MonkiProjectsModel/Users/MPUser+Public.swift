//
//  MPUser+Public.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 08/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension MPUser {
	
	public enum Public {
		
		public struct Small: Codable, Hashable {
			
			public let id: UUID
			public var username: String
			public var displayName: String
			public let url: URL
			public var avatar: AvatarSource?
			public var country: String?
			public let type: MPUserType
			public var updatedAt: Date
			
			public init(
				id: UUID = UUID(),
				username: String,
				displayName: String,
				url: URL,
				avatar: AvatarSource? = nil,
				country: String? = nil,
				type: MPUserType = .user,
				updatedAt: Date = Date()
			) {
				self.id = id
				self.username = username
				self.displayName = displayName
				self.url = url
				self.avatar = avatar
				self.country = country
				self.type = type
				self.updatedAt = updatedAt
			}
			
			public static func == (lhs: Self, rhs: Self) -> Bool {
				return lhs.id == rhs.id
			}
			
		}
		
		public struct Full: Codable, Hashable {
			
			public let id: UUID
			public var username: String
			public var displayName: String
			public var bio: String?
			public let url: URL
			public let htmlUrl: URL
			public var avatar: AvatarSource?
			public var experience: [Sport: SportLevel]
			public var country: String?
			public var location: String?
			public var socialUsernames: [SocialNetwork: String]
			public let type: MPUserType
			public let createdAt: Date
			public var updatedAt: Date
			
			public init(
				id: UUID = UUID(),
				username: String,
				displayName: String,
				bio: String? = nil,
				url: URL,
				htmlUrl: URL,
				avatar: AvatarSource? = nil,
				experience: [Sport: SportLevel] = [:],
				country: String? = nil,
				location: String? = nil,
				socialUsernames: [SocialNetwork: String] = [:],
				type: MPUserType = .user,
				createdAt: Date = Date(),
				updatedAt: Date = Date()
			) {
				self.id = id
				self.username = username
				self.displayName = displayName
				self.bio = bio
				self.url = url
				self.htmlUrl = htmlUrl
				self.avatar = avatar
				self.experience = experience
				self.country = country
				self.location = location
				self.socialUsernames = socialUsernames
				self.type = type
				self.createdAt = createdAt
				self.updatedAt = updatedAt
			}
			
			public static func == (lhs: Self, rhs: Self) -> Bool {
				return lhs.id == rhs.id
			}
			
		}
		
	}
	
}
