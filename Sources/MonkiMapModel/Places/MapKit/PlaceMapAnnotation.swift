//
//  PlaceMapAnnotation.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(MapKit)
import MapKit

public class PlaceMapAnnotation: MKPointAnnotation {
	
	public var model: PlaceAnnotationModel {
		didSet { update() }
	}
	
	public init(model: PlaceAnnotationModel) {
		self.model = model
		
		super.init()
		
		update()
	}
	
	private func update() {
		coordinate = model.coordinate.clLocationCoordinate
		title = model.name
		subtitle = try? model.kind.title()
	}
	
}
#endif
