//
//  SocialNetwork+Username.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 13/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Dictionary where Key == SocialNetwork, Value == URL {
	
	public var usernames: [Key: String] {
		mapValues { $0.lastPathComponent }
	}
	
}
