//
//  Locale+Ext.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 29/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Locale {
	
	static var en: Locale { .init(identifier: "en") }
	static var fr: Locale { .init(identifier: "fr") }
	
	static var `default`: Locale { .en }
	static var supported: [Locale] { [.en, .fr] }
	
}
