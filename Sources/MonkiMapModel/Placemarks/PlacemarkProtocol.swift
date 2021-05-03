//
//  PlacemarkProtocol.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

protocol PlacemarkProtocol {
	
	var id: UUID { get }
	var state: Placemark.State { get }
	
	var kindId: Placemark.Kind { get }
	var categoryId: Placemark.Category { get }
	
}

extension Placemark.Public: PlacemarkProtocol {
	
	var kindId: Placemark.Kind { kind }
	var categoryId: Placemark.Category { category }
	
}
