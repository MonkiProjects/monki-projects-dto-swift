//
//  User+Create.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 08/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct Create: Hashable {
		
		public var email: Email
		public var username: User.Username
		public var displayName: User.DisplayName
		public var password, confirmPassword: String
		
		public init(
			email: Email = .init(),
			username: User.Username = .init(),
			displayName: User.DisplayName = .init(),
			password: String = .init(),
			confirmPassword: String = .init()
		) {
			self.email = email
			self.username = username
			self.displayName = displayName
			self.password = password
			self.confirmPassword = confirmPassword
		}
		
	}
	
}

extension User.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case email
		case username
		case displayName = "display_name"
		case password
		case confirmPassword = "confirm_password"
	}
	
}
