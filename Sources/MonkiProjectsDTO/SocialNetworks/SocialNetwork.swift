//
//  SocialNetwork.swift
//  MonkiProjectsDTO
//
//  Created by BARDON Rémi on 13/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public enum SocialNetwork: String, Codable, Hashable {
	
	case instagram, youTube, vimeo, facebook, twitter, messenger, tikTok
	
	public var name: String {
		switch self {
		case .instagram:
			return NSLocalizedString("APP_INSTAGRAM", bundle: .fixedModule, comment: "")
		case .youTube:
			return NSLocalizedString("APP_YOUTUBE", bundle: .fixedModule, comment: "")
		case .vimeo:
			return NSLocalizedString("APP_VIMEO", bundle: .fixedModule, comment: "")
		case .facebook:
			return NSLocalizedString("APP_FACEBOOK", bundle: .fixedModule, comment: "")
		case .twitter:
			return NSLocalizedString("APP_TWITTER", bundle: .fixedModule, comment: "")
		case .messenger:
			return NSLocalizedString("APP_MESSENGER", bundle: .fixedModule, comment: "")
		case .tikTok:
			return NSLocalizedString("APP_TIKTOK", bundle: .fixedModule, comment: "")
		}
	}
	
}

extension SocialNetwork: Comparable {
	
	public static func < (lhs: SocialNetwork, rhs: SocialNetwork) -> Bool {
		guard let lhsIndex = allCases.firstIndex(of: lhs) else {
			fatalError("`SocialNetwork.allCases` doesn't contain \(lhs)")
		}
		guard let rhsIndex = allCases.firstIndex(of: rhs) else {
			fatalError("`SocialNetwork.allCases` doesn't contain \(rhs)")
		}
		
		return lhsIndex < rhsIndex
	}
	
}

/// Extend for testing purposes
extension SocialNetwork: CaseIterable {}
