//
//  User+Create.swift
//  MonkiProjectsDTO
//
//  Created by BARDON Rémi on 08/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	/// Informations required to create a user.
	public struct Create: Hashable {
		
		public var username: User.Username
		public var displayName: User.DisplayName
		public var email: Email
		public var password, confirmPassword: Password
		
		public init(
			username: User.Username = .init(),
			displayName: User.DisplayName = .init(),
			email: Email = .init(),
			password: Password = .init(),
			confirmPassword: Password = .init()
		) {
			self.username = username
			self.displayName = displayName
			self.email = email
			self.password = password
			self.confirmPassword = confirmPassword
		}
		
	}
	
}

extension User.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case username
		case displayName = "display_name"
		case email
		case password
		case confirmPassword = "confirm_password"
	}
	
}
