//
//  PlaceSubmissionReview+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Place.Submission.Review {
	
	public struct Public: Hashable, Identifiable {
		
		public let id: UUID
		public let submission: Place.Submission.Public.ID
		public let place: Place.Public.ID
		public let reviewer: User.Public.Small.ID
		public let opinion: Opinion
		public let comment: String
		public let issues: [Issue.Public]
		public let moderated: Bool
		public let createdAt: Date
		
		public init(
			id: ID = UUID(),
			submission: Place.Submission.Public.ID,
			place: Place.Public.ID,
			reviewer: User.Public.Small.ID,
			opinion: Opinion,
			comment: String,
			issues: [Issue.Public] = [],
			moderated: Bool = false,
			createdAt: Date = Date()
		) {
			self.id = id
			self.submission = submission
			self.place = place
			self.reviewer = reviewer
			self.opinion = opinion
			self.comment = comment
			self.issues = issues
			self.moderated = moderated
			self.createdAt = createdAt
		}
		
	}
	
}

extension Place.Submission.Review.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case submission, place
		case reviewer, opinion, comment, issues
		case moderated
		case createdAt = "created_at"
	}
	
}
