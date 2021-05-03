//
//  Locale+Recursive.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 29/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Locale {
	
	/// Raw value of `CFLocaleKey.languageCode`.
	/// Returned as a plain string because `CoreFoundation` isn't available on Linux.
	static var languageCodeKey: String { "kCFLocaleLanguageCodeKey" }
	/// Raw value of `CFLocaleKey.countryCode`.
	/// Returned as a plain string because `CoreFoundation` isn't available on Linux.
	static var countryCodeKey: String { "kCFLocaleCountryCodeKey" }
	
	func firstMatch<Output>(in function: (Locale) throws -> (Output)) rethrows -> Output {
		var components = Locale.components(fromIdentifier: self.identifier)
		
		// Keep only language and country codes
		components = [
			Self.languageCodeKey: components[Self.languageCodeKey],
			Self.countryCodeKey: components[Self.countryCodeKey],
		].compactMapValues({ $0 })
		
		// `Locale` from components constructor
		let locale: () -> Locale = {
			Locale(identifier: Locale.identifier(fromComponents: components))
		}
		
		// Try with language and country codes
		do {
			return try function(locale())
		} catch {}
		
		// Remove country code
		components.removeValue(forKey: Self.countryCodeKey)
		
		// Try again with only language code
		return try function(locale())
	}
	
}
