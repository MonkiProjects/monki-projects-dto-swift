//
//  GeographicNotation.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 25/08/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public protocol GeographicNotation {
	
	/// Decimal Degree Notation
	func ddNotation() -> String
	
	/// Degree Minute Notation
	func dmNotation(full: Bool) -> String
	
	/// Degree Minute Second Notation
	func dmsNotation(full: Bool) -> String
	
}

extension GeographicNotation {
	
	/// Degree Minute Notation
	public func dmNotation() -> String {
		self.dmNotation(full: false)
	}
	
	/// Degree Minute Second Notation
	public func dmsNotation() -> String {
		self.dmsNotation(full: false)
	}
	
}
