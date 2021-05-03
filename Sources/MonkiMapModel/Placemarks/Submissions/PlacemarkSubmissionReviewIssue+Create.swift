//
//  PlacemarkSubmissionReviewIssue+Create.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 11/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Submission.Review.Issue {
	
	public struct Create: Codable, Hashable {
		
		public let reason: Reason
		public let comment: String
		
		public init(reason: Reason, comment: String) {
			self.reason = reason
			self.comment = comment
		}
		
	}
	
}
