//
//  RawKeyedCodableDictionary.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 28/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

/// Comes from <https://gist.github.com/jarrodldavis/8c9e7e6e487991279c2df2d452baaf16>
///
/// # Related: #
/// - <https://forums.swift.org/t/json-encoding-decoding-weird-encoding-of-dictionary-with-enum-values/12995>
/// - <https://bugs.swift.org/browse/SR-7788>
@propertyWrapper
public struct RawKeyedCodableDictionary<Key, Value>: Codable
	where Key: Hashable & RawRepresentable,
		  Key.RawValue: Codable & Hashable,
		  Value: Codable
{
	
	public var wrappedValue: [Key: Value]
	
	public init() {
		self.wrappedValue = [:]
	}
	
	public init(wrappedValue: [Key: Value]) {
		self.wrappedValue = wrappedValue
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let rawKeyedDictionary = try container.decode([Key.RawValue: Value].self)
		
		self.wrappedValue = [:]
		for (rawKey, value) in rawKeyedDictionary {
			guard let key = Key(rawValue: rawKey) else {
				throw DecodingError.dataCorruptedError(
					in: container,
					debugDescription: "Invalid key: cannot initalize \(Key.self) from invalid \(Key.RawValue.self) value \(rawKey)"
				)
			}
			self.wrappedValue[key] = value
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		let rawKeyedDictionary = Dictionary(uniqueKeysWithValues: self.wrappedValue.map { ($0.rawValue, $1) })
		var container = encoder.singleValueContainer()
		try container.encode(rawKeyedDictionary)
	}
	
}
