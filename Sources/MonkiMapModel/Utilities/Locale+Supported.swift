//
//  Locale+Supported.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 29/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import OSLog

fileprivate let logger = Logger(subsystem: "com.monkiprojects.monkimap", category: "locale")

extension Locale {
	
	internal static let en = Locale(identifier: "en")
	internal static let fr = Locale(identifier: "fr")
	
	internal static let `default`: Locale = en
	internal static let supported: [Locale] = [en, fr]
	
	internal static var preferredLanguagesHashCache: Int?
	internal static var bestCache: Locale??
	internal static var bestLanguageCache: Locale??
	
	internal static var best: Locale? {
		checkCache()
		
		if let best = bestCache {
			logger.trace("\(#function) Got best=\(best?.identifier ?? "nil") from cache")
			return best
		}
		
		logger.trace("\(#function) Locale.supported=\(Locale.supported)")
		logger.trace("\(#function) Locale.preferredLanguages=\(Locale.preferredLanguages)")
		
		let best = Locale.preferredLanguages
			.map(Locale.init(identifier:))
			.first(where: { locale in
				Locale.supported.contains(locale)
				|| (locale.languageCode.map(Locale.supported.map(\.languageCode).contains(_:)) ?? false)
			})
		
		logger.trace("\(#function) best=\(best?.identifier ?? "nil")")
		
		preferredLanguagesHashCache = Locale.preferredLanguages.hashValue
		bestCache = best
		
		return best
	}
	
	internal var orBestLocale: Locale {
		logger.trace("\(#function) \(self)")
		
		let best = Locale.preferredLanguages
			.map(Locale.init(identifier:))
			.first(where: { $0 == self || $0.languageCode == self.languageCode })
		
		logger.trace("\(#function) best=\(best?.identifier ?? "nil")")
		
		return best ?? self
	}
	
	internal static var bestLanguage: Locale? {
		checkCache()
		
		if let best = bestLanguageCache {
			logger.trace("\(#function) Got best=\(best?.identifier ?? "nil") from cache")
			return best
		}
		
		logger.trace("\(#function) Locale.supported=\(Locale.supported)")
		logger.trace("\(#function) Locale.preferredLanguages=\(Locale.preferredLanguages)")
		
		let best = Locale.preferredLanguages
			.map(Locale.init(identifier:))
			.compactMap(\.languageCode)
			.first(where: Locale.supported.map(\.languageCode).contains(_:))
			.map(Locale.init(identifier:))
		
		logger.trace("\(#function) best=\(best?.identifier ?? "nil")")
		
		preferredLanguagesHashCache = Locale.preferredLanguages.hashValue
		bestLanguageCache = best
		
		return best
	}
	
	internal var orBestLanguage: Locale {
		logger.trace("\(#function) \(self)")
		
		let best = Locale.preferredLanguages
			.map(Locale.init(identifier:))
			.compactMap(\.languageCode)
			.first(where: { $0 == self.languageCode })
			.map(Locale.init(identifier:))
		
		logger.trace("\(#function) best=\(best?.identifier ?? "nil")")
		
		return best ?? self
	}
	
	internal static func checkCache() {
		if Self.preferredLanguagesHashCache != Locale.preferredLanguages.hashValue {
			invalidateCache()
		}
	}
	
	internal static func invalidateCache() {
		Self.preferredLanguagesHashCache = nil
		Self.bestCache = nil
		Self.bestLanguageCache = nil
	}
	
}

extension Optional where Wrapped == Locale {
	
	internal var orBestLocale: Locale? {
		switch self {
		case .some(let wrapped):
			return wrapped.orBestLocale
		case .none:
			return Locale.best
		}
	}
	
	internal var orBestLanguage: Locale? {
		switch self {
		case .some(let wrapped):
			return wrapped.orBestLanguage
		case .none:
			return Locale.bestLanguage
		}
	}
	
}
