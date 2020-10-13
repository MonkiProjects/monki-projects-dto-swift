//
//  SocialNetwork.swift
//  MonkiProjectsModel
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
			return NSLocalizedString("APP_INSTAGRAM", bundle: .module, comment: "")
		case .youTube:
			return NSLocalizedString("APP_YOUTUBE", bundle: .module, comment: "")
		case .vimeo:
			return NSLocalizedString("APP_VIMEO", bundle: .module, comment: "")
		case .facebook:
			return NSLocalizedString("APP_FACEBOOK", bundle: .module, comment: "")
		case .twitter:
			return NSLocalizedString("APP_TWITTER", bundle: .module, comment: "")
		case .messenger:
			return NSLocalizedString("APP_MESSENGER", bundle: .module, comment: "")
		case .tikTok:
			return NSLocalizedString("APP_TIKTOK", bundle: .module, comment: "")
		}
	}
	
}

extension SocialNetwork: Comparable {
	
	public static func < (lhs: SocialNetwork, rhs: SocialNetwork) -> Bool {
		allCases.firstIndex(of: lhs)! < allCases.firstIndex(of: rhs)!
	}
	
}

/// Extend for testing purposes
extension SocialNetwork: CaseIterable {}
