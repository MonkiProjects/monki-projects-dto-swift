//
//  PlaceProperty+Internal.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Property {
	
	/// The internal structure of `Place.Property`.
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
		
		static let fileName = "PlaceProperties"
		
		let id: Place.Property.ID
		let title: Place.Property.Title
		let kind: Place.Property.Kind.ID
		
	}
	
}

extension Place.Property.Internal: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id, title, kind
	}
	
}
