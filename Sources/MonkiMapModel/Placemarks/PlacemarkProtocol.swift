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
	
	var kindId: Placemark.Kind.ID { get }
	var categoryId: Placemark.Category.ID { get }
	
}

extension Placemark.Public: PlacemarkProtocol {
	
	public var kindId: Placemark.Kind.ID { kind }
	public var categoryId: Placemark.Category.ID { category }
	
}
