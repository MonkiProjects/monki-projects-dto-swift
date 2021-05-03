//
//  NilError.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 28/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension NilError {
	
	init(file: String, extension: String, locale: String, in bundle: Bundle) {
		self = .init(custom: "Could not find '\(file).\(`extension`)' in '\(locale)' locale in Bundle '\(bundle)'")
	}
	
}
