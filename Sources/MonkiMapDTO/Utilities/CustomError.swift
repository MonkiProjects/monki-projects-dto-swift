//
//  CustomError.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 28/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

internal struct CustomError: Error, CustomStringConvertible {
	
	let description: String
	
	init(reason: String) {
		self.description = reason
	}
	
}
