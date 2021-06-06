//
//  PlacemarkProtocol.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public protocol PlacemarkProtocol {
	
	var id: Placemark.ID { get }
	var state: Placemark.State { get }
	
	var kindId: Placemark.Kind { get }
	var categoryId: Placemark.Category { get }
	
}

extension Placemark.Public: PlacemarkProtocol {
	
	public var kindId: Placemark.Kind { kind }
	public var categoryId: Placemark.Category { category }
	
}
