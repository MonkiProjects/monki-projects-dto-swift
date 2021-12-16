//
//  User+Public.swift
//  MonkiProjectsDTO
//
//  Created by BARDON Rémi on 08/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public protocol UserPublicSmallProtocol {
	var id: User.ID { get }
	var username: User.Username { get set }
	var displayName: User.DisplayName { get set }
	var avatar: ImageSource? { get set }
	var country: User.Country? { get set }
	var kind: User.Kind { get }
	var updatedAt: Date { get set }
}

public protocol UserPublicFullProtocol: UserPublicSmallProtocol {
	var details: User.Details { get set }
}

extension User {
	
	public enum Public {
		
		/// Public informations about a user (only required ones).
		public struct Small: Hashable, Identifiable, UserPublicSmallProtocol {
			
			public let id: User.ID
			public var username: User.Username
			public var displayName: User.DisplayName
			public var avatar: ImageSource?
			public var country: User.Country?
			public let kind: User.Kind
			public var updatedAt: Date
			
			public init(
				id: User.ID = .init(),
				username: User.Username,
				displayName: User.DisplayName,
				avatar: ImageSource? = nil,
				country: User.Country? = nil,
				kind: User.Kind = .user,
				updatedAt: Date = .init()
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
		
		/// Public informations about a user (including all details).
		public struct Full: Hashable, Identifiable, UserPublicFullProtocol {
			
			public let id: User.ID
			public var username: User.Username
			public var displayName: User.DisplayName
			public var avatar: ImageSource?
			public var country: User.Country?
			public let kind: User.Kind
			public var updatedAt: Date
			
			public var details: User.Details
			
			public init(
				id: User.ID = .init(),
				username: User.Username,
				displayName: User.DisplayName,
				avatar: ImageSource? = nil,
				country: User.Country? = nil,
				kind: User.Kind = .user,
				updatedAt: Date = .init(),
				details: User.Details = .init()
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
				with details: User.Details = .init()
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

extension User.Public.Small: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case username
		case displayName = "display_name"
		case avatar
		case country
		case kind
		case updatedAt = "updated_at"
	}
	
}

extension User.Public.Full: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case username
		case displayName = "display_name"
		case avatar
		case country
		case kind
		case updatedAt = "updated_at"
		case details
	}
	
}
