//
//  User+Update.swift
//  MonkiProjectsDTO
//
//  Created by Rémi Bardon on 14/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct Update: Hashable {
		
		public var username: User.Username?
		public var displayName: User.DisplayName?
		
		public init(
			username: User.Username? = nil,
			displayName: User.DisplayName? = nil
		) {
			self.username = username
			self.displayName = displayName
		}
		
	}
	
}

extension User.Update: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case username
		case displayName = "display_name"
	}
	
}
