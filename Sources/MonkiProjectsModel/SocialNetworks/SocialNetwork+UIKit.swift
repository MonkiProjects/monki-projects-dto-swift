//
//  SocialNetwork+UIKit.swift
//  MonkiProjectsModel
//
//  Created by BARDON Rémi on 13/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension SocialNetwork {
	
	/// Colors from [SchemeColor](https://schemecolor.com)
	@available(iOS 11.0, *)
	public var uiColor: UIColor {
		let namedColor: UIColor?
		
		switch self {
		case .instagram:
			namedColor = UIColor(named: "instagram", in: .fixedModule, compatibleWith: nil)
		case .youTube:
			namedColor = UIColor(named: "youtube", in: .fixedModule, compatibleWith: nil)
		case .vimeo:
			namedColor = UIColor(named: "vimeo", in: .fixedModule, compatibleWith: nil)
		case .facebook:
			namedColor = UIColor(named: "facebook", in: .fixedModule, compatibleWith: nil)
		case .twitter:
			namedColor = UIColor(named: "twitter", in: .fixedModule, compatibleWith: nil)
		case .messenger:
			namedColor = UIColor(named: "messenger-2", in: .fixedModule, compatibleWith: nil)
		case .tikTok:
			namedColor = UIColor(named: "tiktok-2", in: .fixedModule, compatibleWith: nil)
		}
		
		return namedColor ?? UIColor.systemBlue
	}
	
	/// Icons from [Icons8](https://icons8.com)
	public var uiIcon: UIImage {
		let namedImage: UIImage?
		
		switch self {
		case .instagram:
			namedImage = UIImage(named: "icons8-instagram", in: .fixedModule, compatibleWith: nil)
		case .youTube:
			namedImage = UIImage(named: "icons8-youtube", in: .fixedModule, compatibleWith: nil)
		case .vimeo:
			namedImage = UIImage(named: "icons8-vimeo", in: .fixedModule, compatibleWith: nil)
		case .facebook:
			namedImage = UIImage(named: "icons8-facebook", in: .fixedModule, compatibleWith: nil)
		case .twitter:
			namedImage = UIImage(named: "icons8-twitter", in: .fixedModule, compatibleWith: nil)
		case .messenger:
			namedImage = UIImage(named: "icons8-facebook_messenger", in: .fixedModule, compatibleWith: nil)
		case .tikTok:
			namedImage = UIImage(named: "icons8-tiktok", in: .fixedModule, compatibleWith: nil)
		}
		
		return namedImage ?? UIImage()
	}
	
}
#endif
