//
//  MultiLocaleLocalizable.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 29/10/2020.
//

import Foundation

public protocol MultiLocaleLocalizable {
	
	associatedtype Localized
	
	func localized(in locale: Locale) throws -> Localized
	
}

extension MultiLocaleLocalizable {
	
	public func localizedInPreferredLocale(from preferredLocales: [Locale]) throws -> Localized {
		// First, make sure array isn't empty
		let preferredLocale = try preferredLocales.unwrappedFirst()
		
		// Then, try each locale one by one and ignore errors
		for locale in preferredLocales {
			do {
				return try localized(in: locale)
			} catch {}
		}
		
		// Finally, if no result was found, throw missing preferred locale error
		return try localized(in: preferredLocale) // Will always throw
	}
	
	public func localizedInPreferredLanguage(
		from preferredLanguages: [String] = Locale.preferredLanguages
	) throws -> Localized {
		// First, make sure array isn't empty
		try preferredLanguages.guardNotEmpty()
		
		return try localizedInPreferredLocale(from: preferredLanguages.map(Locale.init(identifier:)))
	}
	
}
