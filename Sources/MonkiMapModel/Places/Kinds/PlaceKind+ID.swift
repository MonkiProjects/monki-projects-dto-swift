//
//  PlaceKind+ID.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 06/06/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Place.Kind {
	
	/// The kind of a place.
	/// It impacts its icon on a map marker.
	public enum ID: String, Codable, Hashable, Identifiable, CaseIterable, DefaultCaseDecodable {
		
		case unknown
		case trainingSpot = "training_spot"
		case outdoorParkourPark = "outdoor_parkour_park"
		case calisthenicsPark = "calisthenics_park"
		case descent
		case urbanClimbingSpot = "urban_climbing_spot"
		case playground
		case indoorParkourPark = "indoor_parkour_park"
		case boulderingFacility = "bouldering_facility"
		case aomAcademy = "aom_academy"
		case trickingSchool = "tricking_school"
		case trampolinePark = "trampoline_park"
		case gymnasticsGym = "gymnastics_gym"
		case drinkingFountain = "drinking_fountain"
		case bikeRental = "bike_rental"
		
		public static var defaultCase: Self = .unknown
		
		public var id: RawValue { self.rawValue }
		
	}
	
}
