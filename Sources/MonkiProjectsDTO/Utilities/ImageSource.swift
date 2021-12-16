//
//  ImageSource.swift
//  MonkiProjectsDTO
//
//  Created by BARDON Rémi on 22/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

/// An image source (`URL`, image `Data` or predefined asset).
///
/// # Example encoded values
///
/// ```json
/// {"url":"https:\/\/monkiprojects.com/assets/avatars/person-1.jpg"}
/// ```
///
/// ```json
/// {"asset":"person-1"}
/// ```
public enum ImageSource: Hashable {
	case url(URL), asset(String), data(Data)
}

extension ImageSource: Codable {
	
	enum CodingKeys: String, CodingKey {
		case url, asset
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		if let assetName = try container.decodeIfPresent(String.self, forKey: .asset) {
			self = .asset(assetName)
		} else {
			self = .url(try container.decode(URL.self, forKey: .url))
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		switch self {
		case .url(let url):
			try container.encode(url, forKey: .url)
		case .asset(let assetName):
			try container.encode(assetName, forKey: .asset)
		case .data:
			// swiftlint:disable:next line_length
			throw EncodingError.invalidValue(self, .init(codingPath: [], debugDescription: ".data not supported for encoding"))
		}
	}
	
}
