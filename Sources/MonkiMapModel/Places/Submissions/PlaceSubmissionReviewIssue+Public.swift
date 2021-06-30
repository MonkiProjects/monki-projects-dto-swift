//
//  PlaceSubmissionReviewIssue+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Place.Submission.Review.Issue {
	
	public struct Public: Hashable, Identifiable {
		
		public let id: UUID
		public let place: Place.Public.ID
		public let issuer: User.Public.Small.ID
		public let reason: Reason
		public let comment: String
		public let state: State
		public let createdAt: Date
		
		public init(
			id: ID = UUID(),
			place: Place.Public.ID,
			issuer: User.Public.Small.ID,
			reason: Reason,
			comment: String,
			state: State,
			createdAt: Date = Date()
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

extension Place.Submission.Review.Issue.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case place
		case issuer, reason, comment, state
		case createdAt = "created_at"
	}
	
}
