//
//  PlaceSubmissionReview+Opinion.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission.Review {
	
	public enum Opinion: String, Codable, Hashable {
		case positive
		case needsChanges = "needs_changes"
		case negative
	}
	
}

/// Extend for testing purposes
extension Place.Submission.Review.Opinion: CaseIterable {}
