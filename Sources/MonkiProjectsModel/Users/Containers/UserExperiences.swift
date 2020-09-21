//
//  UserExperiences.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public struct UserExperiences: Codable, Hashable {
	
	public let parkour: Level?
	public let freerunning: Level?
	public let tricking: Level?
	public let chaseTag: Level?
	public let ninjaWarrior: Level?
	public let bouldering: Level?
	public let gymnastics: Level?
	
	public init(
		parkour: Level? = nil,
		freerunning: Level? = nil,
		tricking: Level? = nil,
		chaseTag: Level? = nil,
		ninjaWarrior: Level? = nil,
		bouldering: Level? = nil,
		gymnastics: Level? = nil
	) {
		self.parkour 		= parkour
		self.freerunning 	= freerunning
		self.tricking 		= tricking
		self.chaseTag 		= chaseTag
		self.ninjaWarrior 	= ninjaWarrior
		self.bouldering 	= bouldering
		self.gymnastics 	= gymnastics
	}
	
}
