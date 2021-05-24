//
//  PlacemarkSubmissionReview+Create.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 11/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Submission.Review {
	
	public struct Create: Codable, Hashable {
		
		public enum CodingKeys: String, CodingKey {
			case opinion, comment, issues
		}
		
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
