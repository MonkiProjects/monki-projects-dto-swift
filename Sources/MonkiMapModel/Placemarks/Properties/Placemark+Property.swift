//
//  Placemark+Property.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public extension Placemark {
	
	// A property a placemark could have
	struct Property: Hashable, Identifiable {
		public let id: String
		public let kind: Kind
	}
	
}
