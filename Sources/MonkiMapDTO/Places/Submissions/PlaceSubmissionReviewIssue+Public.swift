//
//  PlaceSubmissionReviewIssue+Public.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsDTO

extension Place.Submission.Review.Issue.DTO {
	
	public struct Public: Hashable, Identifiable {
		
		public let id: Place.Submission.Review.Issue.ID
		public let place: Place.ID
		public let issuer: User.ID
		public let reason: Place.Submission.Review.Issue.Reason
		public let comment: String
		public let state: Place.Submission.Review.Issue.State
		public let createdAt: Date
		
		public init(
			id: ID = .init(),
			place: Place.DTO.Public.ID,
			issuer: User.Public.Small.ID,
			reason: Place.Submission.Review.Issue.Reason,
			comment: String,
			state: Place.Submission.Review.Issue.State,
			createdAt: Date = .init()
		) {
			self.id = id
			self.place = place
			self.issuer = issuer
			self.reason = reason
			self.comment = comment
			self.state = state
			self.createdAt = createdAt
		}
		
	}
	
}

extension Place.Submission.Review.Issue.DTO.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case place
		case issuer, reason, comment, state
		case createdAt = "created_at"
	}
	
}
