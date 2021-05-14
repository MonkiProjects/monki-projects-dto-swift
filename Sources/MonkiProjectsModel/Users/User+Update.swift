//
//  User+Update.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 14/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension User {
	
	public struct Update: Codable, Hashable {
		
		public var username, displayName: String?
		
		public init(
			username: String? = nil,
			displayName: String? = nil
		) {
			self.username = username
			self.displayName = displayName
		}
		
	}
	
}
