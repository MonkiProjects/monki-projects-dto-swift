//
//  EmptyError.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 29/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

struct EmptyError: Error, CustomStringConvertible {
	
	let description: String
	
	init<T>(_ value: T) {
		self.description = "\(type(of: value)) is empty"
	}
	
	init<T>(type: T.Type) {
		self.description = "\(type) is empty"
	}
	
}

extension Array {
	
	func guardNotEmpty() throws {
		guard !self.isEmpty else { throw EmptyError(self) }
	}
	
	func unwrappedFirst() throws -> Element {
		guard let first = self.first else { throw EmptyError(self) }
		return first
	}
	
}
