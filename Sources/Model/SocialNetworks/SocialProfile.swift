//
//  File.swift
//  
//
//  Created by BARDON Rémi on 21/09/2020.
//

import Foundation

public struct SocialProfile: Codable, Hashable {
	
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
