//
//  UserToken+Private.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 08/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public enum Token {
		
		public struct Private: Hashable {
			
			public let value: String
			public let expiresAt: Date?
			public let createdAt: Date
			
			public init(value: String, expiresAt: Date?, createdAt: Date) {
				self.value = value
				self.expiresAt = expiresAt
				self.createdAt = createdAt
			}
			
		}
		
	}
	
}

extension User.Token.Private: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case value
		case expiresAt = "expires_at"
		case createdAt = "created_at"
	}
	
}
