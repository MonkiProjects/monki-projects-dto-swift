//
//  Place+Visibility.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 24/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsDTO

extension Place {
	
	// The visibility of a place.
	public enum Visibility: String, Hashable, Codable, CaseIterable, DefaultCaseDecodable {
		
		public static var defaultCase: Self = .unknown
		
		// Special case reserved for backwards compatibility.
		case unknown
		
		// State of a place stored online but not visible to anyone except its creator.
		case `private`
		
		// State of a place visible by anyone.
		case `public`
		
	}
	
}
