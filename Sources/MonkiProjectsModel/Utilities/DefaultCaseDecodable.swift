//
//  DefaultCaseDecodable.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 26/08/2020.
//

import Foundation

/// Comes from [OMG a new enum case!](https://link.medium.com/PhETT8BKg9)
public protocol DefaultCaseDecodable: RawRepresentable, CaseIterable where RawValue: Equatable & Codable {
	
	static var defaultCase: Self { get }
	
}

extension DefaultCaseDecodable {
	
	public init(rawValue: RawValue) {
		let value = Self.allCases.first { $0.rawValue == rawValue }
		self = value ?? Self.defaultCase
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		
		let rawValue = try container.decode(RawValue.self)
		self = Self(rawValue: rawValue) ?? Self.defaultCase
	}
	
}
