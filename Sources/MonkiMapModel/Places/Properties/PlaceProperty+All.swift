//
//  PlaceProperty+All.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 17/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Property {
	
	public static func all(in locale: Locale? = nil) -> [Self] {
		let locale = locale ?? .default
		return Self.Internal.all(in: locale)
			.map { Self(kind: $0.kind, id: $0.id) }
	}
	
	public static func all(kind: Self.Kind.ID, in locale: Locale? = nil) -> [Self] {
		let locale = locale ?? .default
		return Self.Internal.all(in: locale)
			.filter { $0.kind == kind }
			.map { Self(kind: $0.kind, id: $0.id) }
	}
	
}
