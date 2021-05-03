//
//  PlacemarkProperty+Internal.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Property {
	
	/// The internal structure of `Placemark.Property`.
	/// It's used in localized `.plist` files.
	///
	/// # Example #
	/// ```xml
	/// <dict>
	///     <key>id</key>
	///     <string>small_wall</string>
	///     <key>title</key>
	///     <string>Small Wall</string>
	///     <key>kind</key>
	///     <string>feature</string>
	/// </dict>
	/// ```
	struct Internal: PlistDecodable, Identifiable {
		
		static let fileName = "PlacemarkProperties"
		
		let id, title: String
		let kind: Kind
		
	}
	
}
