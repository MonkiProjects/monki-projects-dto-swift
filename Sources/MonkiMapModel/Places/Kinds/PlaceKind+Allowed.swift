//
//  PlaceKind+Allowed.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/03/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Kind.ID {
	
	public static func allowed(for category: Place.Category.ID) -> [Self] {
		Place.Kind.Internal.all()
			.filter { $0.category == category }
			.map(\.id)
	}
	
}
