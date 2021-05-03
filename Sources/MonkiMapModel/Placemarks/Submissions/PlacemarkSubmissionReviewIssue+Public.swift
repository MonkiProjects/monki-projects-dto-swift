//
//  PlacemarkSubmissionReviewIssue+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

extension Placemark.Submission.Review.Issue {
	
	public struct Public: Codable, Hashable, Identifiable {
		
		public let id: UUID
		public let placemark: Placemark.Public.ID
		public let issuer: User.Public.Small.ID
		public let reason: Reason
		public let comment: String
		public let state: State
		public let createdAt: Date
		
		public init(
			id: ID = UUID(),
			placemark: Placemark.Public.ID,
			issuer: User.Public.Small.ID,
			reason: Reason,
			comment: String,
			state: State,
			createdAt: Date = Date()
		) {
			self.id = id
			self.placemark = placemark
			self.issuer = issuer
			self.reason = reason
			self.comment = comment
			self.state = state
			self.createdAt = createdAt
		}
		
	}
	
}
