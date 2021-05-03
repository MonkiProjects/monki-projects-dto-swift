//
//  Placemark+Kind.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public extension Placemark {
	
	/// The kind of a placemark.
	/// It impacts its icon on a map marker.
	enum Kind: String, Codable, Hashable, Identifiable, DefaultCaseDecodable {
		
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

/// Extend for testing purposes
extension Placemark.Kind: CaseIterable {}
