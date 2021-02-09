//
//  User+Create.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 08/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct Create: Codable, Hashable {
		
		public var email, username, displayName: String
		public var password, confirmPassword: String
		
		public init(
			email: String = "",
			username: String = "",
			displayName: String = "",
			password: String = "",
			confirmPassword: String = ""
		) {
			self.email = email
			self.username = username
			self.displayName = displayName
			self.password = password
			self.confirmPassword = confirmPassword
		}
		
	}
	
}
