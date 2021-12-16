//
//  SportLevel.swift
//  MonkiProjectsDTO
//
//  Created by BARDON Rémi on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public enum SportLevel: UInt8, Codable, Hashable {
	
	case neverTried = 0
	case beginner = 1
	case intermediate = 2
	case advanced = 3
	case professional = 4
	
	public var title: String {
		switch self {
		case .neverTried:
			return NSLocalizedString("LEVEL_NEVER_TRIED", bundle: .module, comment: "")
		case .beginner:
			return NSLocalizedString("LEVEL_BEGINNER", bundle: .module, comment: "")
		case .intermediate:
			return NSLocalizedString("LEVEL_INTERMEDIATE", bundle: .module, comment: "")
		case .advanced:
			return NSLocalizedString("LEVEL_ADVANCED", bundle: .module, comment: "")
		case .professional:
			return NSLocalizedString("LEVEL_PROFESSIONAL", bundle: .module, comment: "")
		}
	}
	
}

extension SportLevel: Comparable {
	
	public static func < (lhs: SportLevel, rhs: SportLevel) -> Bool {
		lhs.rawValue < rhs.rawValue
	}
	
}

/// Extend for testing purposes
extension SportLevel: CaseIterable {}
