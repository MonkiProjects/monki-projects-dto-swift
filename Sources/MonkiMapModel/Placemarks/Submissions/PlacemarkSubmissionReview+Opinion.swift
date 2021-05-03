//
//  PlacemarkSubmissionReview+Opinion.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Submission.Review {
	
	public enum Opinion: String, Codable, Hashable {
		case positive, needsChanges, negative
	}
	
}

/// Extend for testing purposes
extension Placemark.Submission.Review.Opinion: CaseIterable {}
