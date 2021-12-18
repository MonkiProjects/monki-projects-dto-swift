//
//  PlaceSubmission+Public.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission.DTO {
	
	public struct Public: Hashable, Identifiable {
		
		public let id: Place.Submission.ID
		public let place: Place.ID
		public let state: Place.Submission.State
		public let reviews: [Place.Submission.Review.DTO.Public]
		public let positiveReviews, negativeReviews: UInt8
		public let createdAt, updatedAt: Date
		
		public init(
			id: ID = .init(),
			place: Place.ID,
			state: Place.Submission.State = .waitingForReviews,
			reviews: [Place.Submission.Review.DTO.Public] = [],
			positiveReviews: UInt8 = 0,
			negativeReviews: UInt8 = 0,
			createdAt: Date = .init(),
			updatedAt: Date = .init()
		) {
			self.id = id
			self.place = place
			self.state = state
			self.reviews = reviews
			self.positiveReviews = positiveReviews
			self.negativeReviews = negativeReviews
			self.createdAt = createdAt
			self.updatedAt = updatedAt
		}
		
	}
	
}

extension Place.Submission.DTO.Public: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case id
		case place
		case state
		case reviews
		case positiveReviews = "positive_reviews"
		case negativeReviews = "negative_reviews"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
	
}
