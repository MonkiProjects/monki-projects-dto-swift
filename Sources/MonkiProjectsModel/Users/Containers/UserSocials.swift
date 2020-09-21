//
//  UserSocials.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public struct UserSocials: Codable, Hashable {
	
	public typealias Link = URL
	
	public let instagram: Link?
	public let youTube: Link?
	public let vimeo: Link?
	public let facebook: Link?
	public let twitter: Link?
	public let tikTok: Link?
	public let messenger: Link?
	
	public init(
		instagram: Link? = nil,
		youTube: Link? = nil,
		vimeo: Link? = nil,
		facebook: Link? = nil,
		twitter: Link? = nil,
		tikTok: Link? = nil,
		messenger: Link? = nil
	) {
		self.instagram 	= instagram
		self.youTube 	= youTube
		self.vimeo 		= vimeo
		self.facebook 	= facebook
		self.twitter 	= twitter
		self.tikTok 	= tikTok
		self.messenger 	= messenger
	}
	
}
