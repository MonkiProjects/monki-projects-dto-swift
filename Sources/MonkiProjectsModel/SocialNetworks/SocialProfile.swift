//
//  SocialProfile.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public struct SocialProfile: Codable, Hashable {
	
	public enum CodingKeys: String, CodingKey {
		case network, url
	}
	
	public let network: SocialNetwork
	public var url: URL
	
	public init(_ url: URL, for network: SocialNetwork) {
		self.network = network
		self.url = url
	}
	
}

extension SocialProfile: Identifiable {
	
	public var id: SocialNetwork { network }
	
}
