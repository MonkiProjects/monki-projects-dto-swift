//
//  PlaceProtocol.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public protocol PlaceProtocol {
	
	var id: Place.ID { get }
	var state: Place.State { get }
	
	var kindId: Place.Kind.ID { get }
	var categoryId: Place.Category.ID { get }
	
}

extension Place.Public: PlaceProtocol {
	
	public var kindId: Place.Kind.ID { kind }
	public var categoryId: Place.Category.ID { category }
	
}
