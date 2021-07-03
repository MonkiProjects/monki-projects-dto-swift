//
//  User+TypeAliases.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 06/06/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import PrefixedUUID

public struct UserIDPrefix: UUIDPrefix {
	public static var uuidPrefix: String { "user_" }
}

extension User {
	
	/// A unique user identifier.
	public typealias ID = PrefixedUUID<UserIDPrefix>
	
	/// A username (`@`).
	///
	/// # Notes
	///
	/// 1. Pattern: `^[a-z0-9._-]{3,32}$`
	/// 2. Length: `3...32`
	///
	/// # Example
	///
	/// ```
	/// lorem_ipsum
	/// ```
	public typealias Username = String
	
	/// A user display name.
	///
	/// # Notes
	///
	/// 1. Length: `3...32`
	///
	/// # Example
	///
	/// ```
	/// Lorem Ipsum
	/// ```
	public typealias DisplayName = String
	
	/// The country of a user. Will generally show as a flag next to the user's display name.
	///
	/// # Example
	///
	/// ```
	/// FR
	/// ```
	public typealias Country = String
	
	/// A user's bio (profile description).
	public typealias Bio = String
	
	/// A user's location. It's not formatted nor checked as an existing place, so it could be anything.
	public typealias Location = String
	
	public typealias Experience = [Sport: SportLevel]
	
	public typealias SocialUsernames = [SocialNetwork: String]
	
}
