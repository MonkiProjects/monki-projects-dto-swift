//
//  PlacemarkKind+Allowed.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/03/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Kind.ID {
	
	public static func allowed(for category: Placemark.Category.ID) -> [Self] {
		Placemark.Kind.Internal.all()
			.filter { $0.category == category }
			.map(\.id)
	}
	
}
