//
//  User+Login.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 14/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct Login: Codable, Hashable {
		
		public enum CodingKeys: String, CodingKey {
			case username, password
		}
		
		public var username, password: String
		
		public init(username: String, password: String) {
			self.username = username
			self.password = password
		}
		
	}
	
}
