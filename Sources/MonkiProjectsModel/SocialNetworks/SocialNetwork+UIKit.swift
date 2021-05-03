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
			namedColor = UIColor(named: "instagram", in: .module, compatibleWith: nil)
		case .youTube:
			namedColor = UIColor(named: "youtube", in: .module, compatibleWith: nil)
		case .vimeo:
			namedColor = UIColor(named: "vimeo", in: .module, compatibleWith: nil)
		case .facebook:
			namedColor = UIColor(named: "facebook", in: .module, compatibleWith: nil)
		case .twitter:
			namedColor = UIColor(named: "twitter", in: .module, compatibleWith: nil)
		case .messenger:
			namedColor = UIColor(named: "messenger-2", in: .module, compatibleWith: nil)
		case .tikTok:
			namedColor = UIColor(named: "tiktok-2", in: .module, compatibleWith: nil)
		}
		
		return namedColor ?? UIColor.systemBlue
	}
	
	/// Icons from [Icons8](https://icons8.com)
	public var uiIcon: UIImage {
		let namedImage: UIImage?
		
		switch self {
		case .instagram:
			namedImage = UIImage(named: "icons8-instagram", in: .module, compatibleWith: nil)
		case .youTube:
			namedImage = UIImage(named: "icons8-youtube", in: .module, compatibleWith: nil)
		case .vimeo:
			namedImage = UIImage(named: "icons8-vimeo", in: .module, compatibleWith: nil)
		case .facebook:
			namedImage = UIImage(named: "icons8-facebook", in: .module, compatibleWith: nil)
		case .twitter:
			namedImage = UIImage(named: "icons8-twitter", in: .module, compatibleWith: nil)
		case .messenger:
			namedImage = UIImage(named: "icons8-facebook_messenger", in: .module, compatibleWith: nil)
		case .tikTok:
			namedImage = UIImage(named: "icons8-tiktok", in: .module, compatibleWith: nil)
		}
		
		return namedImage ?? UIImage()
	}
	
}
#endif
