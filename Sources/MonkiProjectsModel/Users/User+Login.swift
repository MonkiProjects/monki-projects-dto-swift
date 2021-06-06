//
//  User+Login.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 14/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct Login: Hashable {
		
		public var username: User.Username
		public var password: Password
		
		public init(username: User.Username, password: Password) {
			self.username = username
			self.password = password
		}
		
	}
	
}

extension User.Login: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case username, password
	}
	
}
