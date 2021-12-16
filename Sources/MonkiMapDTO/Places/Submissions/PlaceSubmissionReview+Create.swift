//
//  PlaceSubmissionReview+Create.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 11/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission.Review {
	
	public struct Create: Hashable {
		
		public let opinion: Opinion
		public let comment: String?
		public let issues: [Issue.Create]
		
		public init(
			opinion: Opinion,
			comment: String? = nil,
			issues: [Issue.Create] = []
		) {
			self.opinion = opinion
			self.comment = comment
			self.issues = issues
		}
		
	}
	
}

extension Place.Submission.Review.Create: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case opinion, comment, issues
	}
	
}
