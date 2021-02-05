//
//  SocialNetwork+SwiftUI.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 13/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI

#warning("Refactor SwiftUI code in different package")
@available(iOS 13.0, *)
@available(OSX 10.15, *)
extension SocialNetwork {
	
	/// Colors from [SchemeColor](https://schemecolor.com)
	public var color: Color {
		switch self {
		case .instagram:
			return Color("instagram", bundle: .fixedModule)
		case .youTube:
			return Color("youtube", bundle: .fixedModule)
		case .vimeo:
			return Color("vimeo", bundle: .fixedModule)
		case .facebook:
			return Color("facebook", bundle: .fixedModule)
		case .twitter:
			return Color("twitter", bundle: .fixedModule)
		case .messenger:
			return Color("messenger-2", bundle: .fixedModule)
		case .tikTok:
			return Color("tiktok-2", bundle: .fixedModule)
		}
	}
	
	/// Icons from [Icons8](https://icons8.com)
	public var icon: Image {
		switch self {
		case .instagram:
			return Image("icons8-instagram", bundle: .fixedModule)
		case .youTube:
			return Image("icons8-youtube", bundle: .fixedModule)
		case .vimeo:
			return Image("icons8-vimeo", bundle: .fixedModule)
		case .facebook:
			return Image("icons8-facebook", bundle: .fixedModule)
		case .twitter:
			return Image("icons8-twitter", bundle: .fixedModule)
		case .messenger:
			return Image("icons8-facebook_messenger", bundle: .fixedModule)
		case .tikTok:
			return Image("icons8-tiktok", bundle: .fixedModule)
		}
	}
	
}
#endif
