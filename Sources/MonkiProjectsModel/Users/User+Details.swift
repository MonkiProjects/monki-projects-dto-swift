//
//  User+Details.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 10/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct Details: Codable, Hashable {
		
		public var bio, location: String?
		public var experience: [Sport: SportLevel]
		public var socialUsernames: [SocialNetwork: String]
		public let createdAt: Date
		
		public init(
			bio: String? = nil,
			location: String? = nil,
			experience: [Sport: SportLevel] = [:],
			socialUsernames: [SocialNetwork: String] = [:],
			createdAt: Date = Date()
		) {
			self.bio = bio
			self.location = location
			self.experience = experience
			self.socialUsernames = socialUsernames
			self.createdAt = createdAt
		}
		
	}
	
}
