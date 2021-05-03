//
//  Regex+Ext.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/07/2019.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension NSRegularExpression {
	
	/// Tests if a `String` matches the regular expression.
	///
	/// - Parameters:
	///   - string: A `String` to test against the regular expression.
	/// - Returns: `true` if `string` matched regular expression, `false` otherwise.
	///
	/// # Notes: #
	/// - Comes from [How to use regular expressions in Swift](https://www.hackingwithswift.com/articles/108/how-to-use-regular-expressions-in-swift)
	///
	/// # Example #
	/// ```
	/// let regex = NSRegularExpression("[a-z]at")
	/// regex.matches("hat")
	/// ```
	func matches(_ string: String) -> Bool {
		let range = NSRange(location: 0, length: string.utf16.count)
		return firstMatch(in: string, options: [], range: range) != nil
	}
	
}

extension String {
	
	///
	///
	/// - Parameters:
	///   - lhs: Left hand side `String`.
	///   - rhs: Right hand side `String`.
	/// - Returns: `true` if `lhs` matched `rhs` regular expression, `false` otherwise.
	///
	/// # Notes: #
	/// - Comes from [How to use regular expressions in Swift](https://www.hackingwithswift.com/articles/108/how-to-use-regular-expressions-in-swift)
	///
	/// # Example #
	/// ```
	/// "hat" ~= "[a-z]at"
	/// ```
	static func ~= (lhs: String, rhs: String) -> Bool {
		guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
		let range = NSRange(location: 0, length: lhs.utf16.count)
		return regex.firstMatch(in: lhs, options: [], range: range) != nil
	}
	
}
