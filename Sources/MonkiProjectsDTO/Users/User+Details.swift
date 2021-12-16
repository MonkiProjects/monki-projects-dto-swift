//
//  User+Details.swift
//  MonkiProjectsDTO
//
//  Created by Rémi Bardon on 10/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	/// Details about a user.
	public struct Details: Hashable {
		
		public var bio: User.Bio?
		public var location: User.Location?
		@RawKeyedCodableDictionary
		public var experience: User.Experience
		@RawKeyedCodableDictionary
		public var socialUsernames: User.SocialUsernames
		public let createdAt: Date
		
		public init(
			bio: User.Bio? = nil,
			location: User.Location? = nil,
			experience: User.Experience = .init(),
			socialUsernames: User.SocialUsernames = .init(),
			createdAt: Date = .init()
		) {
			self.bio = bio
			self.location = location
			self.experience = experience
			self.socialUsernames = socialUsernames
			self.createdAt = createdAt
		}
		
	}
	
}

extension User.Details: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case bio
		case location
		case experience
		case socialUsernames = "social_usernames"
		case createdAt = "created_at"
	}
	
}
