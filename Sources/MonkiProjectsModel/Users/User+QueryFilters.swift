//
//  User+QueryFilters.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 20/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct QueryFilters: Hashable {
		
		public var username: User.Username?
		public var displayName: User.DisplayName?
		
		public var isEmpty: Bool {
			self.username == nil
				&& self.displayName == nil
		}
		
		public init(
			username: User.Username? = nil,
			displayName: User.DisplayName? = nil
		) {
			self.username = username
			self.displayName = displayName
		}
		
	}
	
}

extension User.QueryFilters: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case username
		case displayName = "display_name"
	}
	
}
