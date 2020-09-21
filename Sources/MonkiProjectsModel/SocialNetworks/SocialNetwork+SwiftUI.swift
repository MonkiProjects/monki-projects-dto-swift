//
//  SocialNetwork+SwiftUI.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 13/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
@available(OSX 10.15, *)
extension SocialNetwork {
	
	/// Colors from [SchemeColor](https://schemecolor.com)
	public var color: Color {
		switch self {
		case .instagram:
			return Color("instagram", bundle: .module)
		case .youTube:
			return Color("youtube", bundle: .module)
		case .vimeo:
			return Color("vimeo", bundle: .module)
		case .facebook:
			return Color("facebook", bundle: .module)
		case .twitter:
			return Color("twitter", bundle: .module)
		case .messenger:
			return Color("messenger-2", bundle: .module)
		case .tikTok:
			return Color("tiktok-2", bundle: .module)
		}
	}
	
	/// Icons from [Icons8](https://icons8.com)
	public var icon: Image {
		switch self {
		case .instagram:
			return Image("icons8-instagram", bundle: .module)
		case .youTube:
			return Image("icons8-youtube", bundle: .module)
		case .vimeo:
			return Image("icons8-vimeo", bundle: .module)
		case .facebook:
			return Image("icons8-facebook", bundle: .module)
		case .twitter:
			return Image("icons8-twitter", bundle: .module)
		case .messenger:
			return Image("icons8-facebook_messenger", bundle: .module)
		case .tikTok:
			return Image("icons8-tiktok", bundle: .module)
		}
	}
	
}
#endif
