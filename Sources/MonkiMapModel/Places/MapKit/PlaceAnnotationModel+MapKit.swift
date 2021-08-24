//
//  PlaceAnnotationModel+MapKit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(MapKit)
import MapKit

extension PlaceAnnotationModel {
	
	var mkAnnotation: MKAnnotation {
		PlaceMapAnnotation(model: self)
	}
	
}
#endif
