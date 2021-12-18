//
//  PlaceSubmissionReview+Create.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 11/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission.Review.DTO {
	
	public struct Create: Hashable {
		
		public let opinion: Place.Submission.Review.Opinion
		public let comment: String?
		public let issues: [Place.Submission.Review.Issue.DTO.Create]
		
		public init(
			opinion: Place.Submission.Review.Opinion,
			comment: String? = nil,
			issues: [Place.Submission.Review.Issue.DTO.Create] = []
		) {
			self.opinion = opinion
			self.comment = comment
			self.issues = issues
		}
		
	}
	
}

extension Place.Submission.Review.DTO.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case opinion, comment, issues
	}
	
}
