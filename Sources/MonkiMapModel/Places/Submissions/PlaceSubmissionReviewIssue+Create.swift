//
//  PlaceSubmissionReviewIssue+Create.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 11/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission.Review.Issue {
	
	public struct Create: Hashable {
		
		public let reason: Reason
		public let comment: String
		
		public init(reason: Reason, comment: String) {
			self.reason = reason
			self.comment = comment
		}
		
	}
	
}

extension Place.Submission.Review.Issue.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case reason, comment
	}
	
}
