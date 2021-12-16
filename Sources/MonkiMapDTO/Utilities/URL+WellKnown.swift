//
//  URL+WellKnown.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 03/07/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsDTO

extension URL {
	
	public static var placeSatelliteImagePlaceholder: Self {
		URL(staticString: "https://monkiprojects.com/images/place_satellite_image_placeholder.png")
	}
	
}
