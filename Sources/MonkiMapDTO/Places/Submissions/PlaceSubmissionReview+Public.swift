//
//  PlaceSubmissionReview+Public.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsDTO

extension Place.Submission.Review.DTO {
	
	public struct Public: Hashable, Identifiable {
		
		public let id: Place.Submission.Review.ID
		public let submission: Place.Submission.ID
		public let place: Place.ID
		public let reviewer: User.ID
		public let opinion: Place.Submission.Review.Opinion
		public let comment: String
		public let issues: [Place.Submission.Review.Issue.DTO.Public]
		public let moderated: Bool
		public let createdAt: Date
		
		public init(
			id: ID = .init(),
			submission: Place.Submission.ID,
			place: Place.ID,
			reviewer: User.ID,
			opinion: Place.Submission.Review.Opinion,
			comment: String,
			issues: [Place.Submission.Review.Issue.DTO.Public] = [],
			moderated: Bool = false,
			createdAt: Date = .init()
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

extension Place.Submission.Review.DTO.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case submission, place
		case reviewer, opinion, comment, issues
		case moderated
		case createdAt = "created_at"
	}
	
}
