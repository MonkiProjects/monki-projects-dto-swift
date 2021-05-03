//
//  PropertyListDecoder+Bundle.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 28/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension PropertyListDecoder {
	
	func decode<T: Decodable>(
		_ type: T.Type,
		fromFile fileName: String,
		ofType fileType: String,
		in bundle: Bundle,
		locale: Locale
	) throws -> T {
		// Get localized file URL
		guard let url = bundle.url(
			forResource: fileName,
			withExtension: fileType,
			subdirectory: nil,
			localization: locale.identifier
		) else {
			throw CustomError(reason: "Unable to find '\(fileName).\(fileType)' (\(locale)) in '\(self)'.")
		}
		
		// Get file data
		let data: Data = try {
			do {
				return try Data(contentsOf: url)
			} catch {
				// swiftlint:disable:next line_length
				throw CustomError(reason: "Unable to decode contents of '\(fileName).\(fileType)' at '\(url)': \(error.localizedDescription).")
			}
		}()
		
		// Decode file data
		do {
			return try decode(T.self, from: data)
		} catch {
			// swiftlint:disable:next line_length
			throw CustomError(reason: "Unable to decode \(T.self) in '\(fileName).\(fileType)' (\(locale)): \(error.localizedDescription).")
		}
	}
	
}
