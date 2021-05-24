//
//  PlacemarkSubmission+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Submission {
	
	public struct Public: Hashable, Identifiable {
		
		public let id: UUID
		public let placemark: Placemark.Public.ID
		public let state: State
		public let reviews: [Review.Public]
		public let positiveReviews, negativeReviews: UInt8
		public let createdAt, updatedAt: Date
		
		public init(
			id: ID = UUID(),
			placemark: Placemark.Public.ID,
			state: State = .waitingForReviews,
			reviews: [Review.Public] = [],
			positiveReviews: UInt8 = 0,
			negativeReviews: UInt8 = 0,
			createdAt: Date = Date(),
			updatedAt: Date = Date()
		) {
			self.id = id
			self.placemark = placemark
			self.state = state
			self.reviews = reviews
			self.positiveReviews = positiveReviews
			self.negativeReviews = negativeReviews
			self.createdAt = createdAt
			self.updatedAt = updatedAt
		}
		
	}
	
}

extension Placemark.Submission.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case placemark
		case state
		case reviews
		case positiveReviews = "positive_reviews"
		case negativeReviews = "negative_reviews"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
	
}
