//
//  AvatarSource.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 22/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

/// An avatar source (`URL` or predefined asset).
///
/// # Example encoded values
///
/// ```json
/// {"url":"https:\/\/monkiprojects.com"}
/// ```
///
/// ```json
/// {"asset":"person-1"}
/// ```
public enum AvatarSource: Hashable {
	case url(URL), asset(String)
}

extension AvatarSource: Codable {
	
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
		}
	}
	
}
