//
//  PlistDecodable.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 30/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

protocol PlistDecodable: Decodable {
	
	static var fileName: String { get }
	
}

extension PlistDecodable {
	
	static func all(in locale: Locale? = nil) -> [Self] {
		let locale = locale ?? .default
		do {
			return try PropertyListDecoder().decode(
				[Self].self,
				fromFile: Self.fileName,
				ofType: "plist",
				in: Bundle.module,
				locale: locale
			)
		} catch {
			return []
		}
	}
	
}
