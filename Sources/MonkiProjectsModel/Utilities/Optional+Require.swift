//
//  Optional+Require.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 14/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

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
