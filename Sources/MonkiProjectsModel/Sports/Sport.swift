//
//  Sport.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public enum Sport: String, Codable, Hashable {
	
	case parkour, freerunning, tricking, chaseTag, ninjaWarrior, bouldering, gymnastics
	
	public var name: String {
		switch self {
		case .parkour:
			return NSLocalizedString("SPORT_PARKOUR", bundle: .fixedModule, comment: "")
		case .freerunning:
			return NSLocalizedString("SPORT_FREERUNNING", bundle: .fixedModule, comment: "")
		case .tricking:
			return NSLocalizedString("SPORT_TRICKING", bundle: .fixedModule, comment: "")
		case .chaseTag:
			return NSLocalizedString("SPORT_CHASE_TAG", bundle: .fixedModule, comment: "")
		case .ninjaWarrior:
			return NSLocalizedString("SPORT_NINJA_WARRIOR", bundle: .fixedModule, comment: "")
		case .bouldering:
			return NSLocalizedString("SPORT_BOULDERING", bundle: .fixedModule, comment: "")
		case .gymnastics:
			return NSLocalizedString("SPORT_GYMNASTICS", bundle: .fixedModule, comment: "")
		}
	}
	
}

extension Sport: Comparable {
	
	public static func < (lhs: Sport, rhs: Sport) -> Bool {
		allCases.firstIndex(of: lhs)! < allCases.firstIndex(of: rhs)!
	}
	
}

/// Extend for testing purposes
extension Sport: CaseIterable {}
