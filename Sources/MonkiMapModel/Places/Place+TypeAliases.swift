//
//  Place+TypeAliases.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 06/06/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import Prefixed

public struct PlaceIDPrefix: PrefixProtocol {
	public static var prefix: String { "place_" }
}

extension Place {
	
	/// A unique place identifier.
	public typealias ID = PrefixedUUID<PlaceIDPrefix>
	
	/// A place `name`.
	///
	/// # Notes
	///
	/// 1. Length: `3...48`
	public typealias Name = String
	
	/// A place `caption`. Possibly empty.
	public typealias Caption = String
	
	/// The city in which a place is.
	///
	/// # Notes
	///
	/// 1. Length: `1...`
	public typealias City = String
	
	/// The city in which a place is.
	///
	/// # Notes
	///
	/// 1. Length: `1...`
	public typealias Country = String
	
}
