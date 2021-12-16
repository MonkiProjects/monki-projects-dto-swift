//
//  JSONDecodable.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 08/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

internal protocol JSONDecodable: Decodable {
	
	static var fileName: String { get }
	
}

extension JSONDecodable {
	
	public static func all(locale: Locale? = nil) -> [Self] {
		JSON5DecodableCacheStorage.shared
			.cache(for: Self.self, in: Self.fileName)
			.all(locale: locale.orBestLanguage)
	}
	
}

fileprivate final class JSON5DecodableCacheStorage {
	
	fileprivate static let shared = JSON5DecodableCacheStorage()
	
	private var cache = [String: Any]()
	
	fileprivate func cache<T: Decodable>(for type: T.Type, in fileName: String) -> JSON5DecodableCache<T> {
		if let cached = self.cache[fileName] as? JSON5DecodableCache<T> {
			return cached
		} else {
			let newCache = JSON5DecodableCache<T>(fileName: fileName)
			self.cache[fileName] = newCache
			return newCache
		}
	}
	
}

fileprivate final class JSON5DecodableCache<Cached: Decodable> {
	
	private var fileName: String
	private var locale: Locale?
	// swiftlint:disable:next discouraged_optional_collection
	private var cache: [Cached]?
	
	fileprivate init(fileName: String) {
		self.fileName = fileName
	}
	
	fileprivate func all(locale: Locale?) -> [Cached] {
		if self.locale != locale { invalidate() }
		if let cache = cache { return cache }
		
		let all = fetch(locale: locale)
		self.cache = all
		self.locale = locale
		return all
	}
	
	fileprivate func invalidate() {
		self.cache = nil
	}
	
	private func fetch(locale: Locale?) -> [Cached] {
		guard let url = Bundle.module.url(
			forResource: fileName,
			withExtension: "json",
			subdirectory: nil,
			localization: locale?.identifier
		) else {
			return []
		}
		
		do {
			let data = try Data(contentsOf: url)
			
			let decoder = JSONDecoder()
			return try decoder.decode([Cached].self, from: data)
		} catch {
			return []
		}
	}
	
}
