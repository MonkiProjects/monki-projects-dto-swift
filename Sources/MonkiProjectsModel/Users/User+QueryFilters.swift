//
//  User+QueryFilters.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 20/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct QueryFilters: Codable, Hashable {
		
		public enum CodingKeys: String, CodingKey {
			case username
			case displayName = "display_name"
		}
		
		public var username, displayName: String?
		
		public var isEmpty: Bool {
			self.username == nil
				&& self.displayName == nil
		}
		
		public init(
			username: String? = nil,
			displayName: String? = nil
		) {
			self.username = username
			self.displayName = displayName
		}
		
	}
	
}