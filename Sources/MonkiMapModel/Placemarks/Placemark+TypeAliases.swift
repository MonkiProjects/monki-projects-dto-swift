//
//  Placemark+TypeAliases.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 06/06/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark {
	
	/// A unique placemark identifier.
	public typealias ID = UUID
	
	/// A placemark `name`.
	///
	/// # Notes
	///
	/// 1. Length: `3...48`
	public typealias Name = String
	
	/// A placemark `caption`. Possibly empty.
	public typealias Caption = String
	
	/// The city in which a placemark is.
	///
	/// # Notes
	///
	/// 1. Length: `1...`
	public typealias City = String
	
	/// The city in which a placemark is.
	///
	/// # Notes
	///
	/// 1. Length: `1...`
	public typealias Country = String
	
}
