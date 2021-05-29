//
//  UserPrivate+RawRepresentable.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 29/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension User.Private: RawRepresentable {
	
	public var rawValue: String {
		do {
			return try JSONEncoder().encode(self).base64EncodedString()
		} catch {
			fatalError("Cannot encode user for raw representation: \(self)")
		}
	}
	
	public init?(rawValue: String) {
		do {
			guard let data = Data(base64Encoded: rawValue) else {
				return nil
			}
			self = try JSONDecoder().decode(Self.self, from: data)
		} catch {
			return nil
		}
	}
	
}
