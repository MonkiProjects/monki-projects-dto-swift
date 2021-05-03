//
//  Strings.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 28/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

enum Strings {
	
	// swiftlint:disable line_length
	/// Translation of the word `"Unknown"`.
	///
	/// - Parameters:
	///   - locale: The desired `Locale` in which to translate the word `"Unknown"`.
	/// - Returns: The word `"Unknown"` in the specified `Locale`.
	/// - Throws: Throws `Error` if `Locale` not found.
	///
	/// # Notes #
	/// - The word returned is capitalized.
	/// - Inspired by [How to force NSLocalizedString to use a specific language](https://stackoverflow.com/a/56108867/10967642)
	///
	/// # Examples #
	/// - Get `"Unknown"` translated in current locale:
	///   ```
	///   let current = Strings.unknown()
	///   ```
	/// - Get `"Unknown"` translated in English:
	///   ```
	///   let english = Strings.unknown(in: Locale(identifier: "en"))
	///   // Returns "Unknown"
	///   ```
	/// - Get `"Unknown"` translated in French:
	///   ```
	///   let french = Strings.unknown(in: Locale(identifier: "fr"))
	///   // Returns "Inconnu"
	///   ```
	static func unknown(in locale: Locale? = nil) throws -> String {
		let locale = locale ?? .default
		let fileName = locale.identifier
		let ext = "lproj"
		guard let url = Bundle.module.url(
			forResource: fileName,
			withExtension: ext,
			subdirectory: nil,
			localization: locale.identifier
		) else {
			throw NilError(file: fileName, extension: ext, locale: locale.identifier, in: .module)
		}
		guard let localizedBundle = Bundle(url: url) else {
			throw NilError(type: Bundle.self)
		}
		return localizedBundle.localizedString(forKey: "UNKNOWN", value: nil, table: nil)
	}
	// swiftlint:enable line_length
	
}
