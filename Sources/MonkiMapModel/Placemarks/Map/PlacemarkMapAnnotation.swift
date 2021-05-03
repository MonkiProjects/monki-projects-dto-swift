//
//  PlacemarkMapAnnotation.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(MapKit)
import MapKit

public class PlacemarkMapAnnotation: MKPointAnnotation {
	
	public var model: PlacemarkAnnotationModel {
		didSet { update() }
	}
	
	public init(model: PlacemarkAnnotationModel) {
		self.model = model
		
		super.init()
		
		update()
	}
	
	private func update() {
		coordinate = CLLocationCoordinate2D(
			latitude: model.latitude,
			longitude: model.longitude
		)
		title = model.title
		subtitle = try? model.kind.title()
	}
	
}
#endif
