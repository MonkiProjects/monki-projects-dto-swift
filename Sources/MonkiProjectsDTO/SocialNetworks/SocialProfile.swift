//
//  SocialProfile.swift
//  MonkiProjectsDTO
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public struct SocialProfile: Hashable {
	
	public let network: SocialNetwork
	public var url: URL
	
	public init(_ url: URL, for network: SocialNetwork) {
		self.network = network
		self.url = url
	}
	
}

extension SocialProfile: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case network, url
	}
	
}

extension SocialProfile: Identifiable {
	
	public var id: SocialNetwork { network }
	
}
