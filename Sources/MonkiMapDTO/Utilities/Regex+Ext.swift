//
//  Regex+Ext.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 05/07/2019.
//  Copyright © 2019 Monki Projects. All rights reserved.
//

import Foundation

extension NSRegularExpression {
	
	/// Tests if a `String` matches the regular expression.
	///
	/// Usage:
	///
	/// ```
	/// let regex = NSRegularExpression("[a-z]at")
	/// regex.matches("hat")
	/// ```
	///
	/// - Parameters:
	///   - string: A `String` to test against the regular expression.
	/// - Returns: `true` if `string` matched regular expression, `false` otherwise.
	/// - Note: Comes from [How to use regular expressions in Swift](https://www.hackingwithswift.com/articles/108/how-to-use-regular-expressions-in-swift)
	func matches(_ string: String) -> Bool {
		return self.firstMatch(in: string) != nil
	}
	
	func firstMatch(in string: String) -> NSTextCheckingResult? {
		let range = NSRange(location: 0, length: string.utf16.count)
		return self.firstMatch(in: string, range: range)
	}
	
}

extension String {
	
	/// Overload Swift’s contains operator to work with regular expressions.
	///
	/// Usage:
	///
	/// ```
	/// "hat" ~= "[a-z]at"
	/// ```
	///
	/// - Parameters:
	///   - lhs: Left hand side `String`.
	///   - rhs: Right hand side `String`.
	/// - Returns: `true` if `lhs` matched `rhs` regular expression, `false` otherwise.
	/// - Notes: Comes from [How to use regular expressions in Swift](https://www.hackingwithswift.com/articles/108/how-to-use-regular-expressions-in-swift)
	static func ~= (lhs: String, rhs: String) -> Bool {
		guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
		let range = NSRange(location: 0, length: lhs.utf16.count)
		return regex.firstMatch(in: lhs, options: [], range: range) != nil
	}
	
}
