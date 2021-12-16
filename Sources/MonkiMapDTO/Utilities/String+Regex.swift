//
//  String+Regex.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 30/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

internal struct StringValidationError: Error, CustomStringConvertible {
	
	let description: String
	
	init(string: String) {
		self.description = "String '\(string)' contains invalid characters."
	}
	
	init(string: String, predicate: NSPredicate) {
		self.description = "String '\(string)' contains invalid characters (predicate: '\(predicate)')."
	}
	
}

extension String {
	
	func validate(with predicate: NSPredicate) throws {
		guard predicate.evaluate(with: self) else {
			throw StringValidationError(string: self, predicate: predicate)
		}
	}
	
}
