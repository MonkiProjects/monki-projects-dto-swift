//
//  NilError.swift
//  MonkiProjectsDTO
//
//  Created by Rémi Bardon on 28/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public struct NilError: Error, CustomStringConvertible {
	
	public let description: String
	
	public init(custom description: String) {
		self.description = description
	}
	
	public init<T>(_ value: T) {
		self.description = "\(type(of: value)) is nil"
	}
	
	public init<T>(type: T.Type) {
		self.description = "\(type) is nil"
	}
	
}

extension Optional {
	
	public func require() throws -> Wrapped {
		switch self {
		case .some(let wrapped):
			return wrapped
		case .none:
			throw NilError(Self.self)
		}
	}
	
}
