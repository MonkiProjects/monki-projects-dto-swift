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
			return NSLocalizedString("SPORT_PARKOUR", bundle: .module, comment: "")
		case .freerunning:
			return NSLocalizedString("SPORT_FREERUNNING", bundle: .module, comment: "")
		case .tricking:
			return NSLocalizedString("SPORT_TRICKING", bundle: .module, comment: "")
		case .chaseTag:
			return NSLocalizedString("SPORT_CHASE_TAG", bundle: .module, comment: "")
		case .ninjaWarrior:
			return NSLocalizedString("SPORT_NINJA_WARRIOR", bundle: .module, comment: "")
		case .bouldering:
			return NSLocalizedString("SPORT_BOULDERING", bundle: .module, comment: "")
		case .gymnastics:
			return NSLocalizedString("SPORT_GYMNASTICS", bundle: .module, comment: "")
		}
	}
	
}

extension Sport: Comparable {
	
	public static func < (lhs: Sport, rhs: Sport) -> Bool {
		guard let lhsIndex = allCases.firstIndex(of: lhs) else {
			fatalError("`Sport.allCases` doesn't contain \(lhs)")
		}
		guard let rhsIndex = allCases.firstIndex(of: rhs) else {
			fatalError("`Sport.allCases` doesn't contain \(rhs)")
		}
		
		return lhsIndex < rhsIndex
	}
	
}

/// Extend for testing purposes
extension Sport: CaseIterable {}
