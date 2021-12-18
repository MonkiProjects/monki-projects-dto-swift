//
//  PlaceSubmissionReviewIssue+Create.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 11/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission.Review.Issue.DTO {
	
	public struct Create: Hashable {
		
		public let reason: Place.Submission.Review.Issue.Reason
		public let comment: String
		
		public init(
			reason: Place.Submission.Review.Issue.Reason,
			comment: String
		) {
			self.reason = reason
			self.comment = comment
		}
		
	}
	
}

extension Place.Submission.Review.Issue.DTO.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case reason, comment
	}
	
}
