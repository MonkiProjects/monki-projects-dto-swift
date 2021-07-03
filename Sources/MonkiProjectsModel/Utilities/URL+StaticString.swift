//
//  URL+StaticString.swift
//  MonkiProjectsModel
//
//  Created by Rémi Bardon on 27/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension URL {
	
	/// Comes from [Constructing URLs in Swift](https://www.swiftbysundell.com/articles/constructing-urls-in-swift/#static-urls)
	public init(staticString string: StaticString) {
		guard let url = URL(string: "\(string)") else {
			preconditionFailure("Invalid static URL string: \(string)")
		}
		
		self = url
	}
	
}
