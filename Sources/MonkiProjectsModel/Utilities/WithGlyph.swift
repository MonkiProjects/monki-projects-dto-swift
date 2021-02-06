//
//  WithGlyph.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

// MARK: - Protocol

public protocol WithGlyph {
	
	static var imageBundle: Bundle { get }
	
	var glyphName: String? { get }
	
}

// MARK: - UIKit

#if canImport(UIKit)
import UIKit

extension WithGlyph {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiGlyph: UIImage? {
		if let imageName = self.glyphName {
			return UIImage(named: imageName, in: Self.imageBundle, compatibleWith: nil)
		} else {
			return nil
		}
	}
	
}
#endif

// MARK: - SwiftUI

#if canImport(SwiftUI)
import SwiftUI

extension WithGlyph {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var glyph: Image? {
		if let imageName = self.glyphName {
			return Image(imageName, bundle: Self.imageBundle)
		} else {
			return nil
		}
	}
	
}
#endif
