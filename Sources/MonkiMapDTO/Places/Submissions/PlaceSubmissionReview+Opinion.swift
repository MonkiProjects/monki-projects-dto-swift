//
//  PlaceSubmissionReview+Opinion.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission.Review {
	
	public enum Opinion: String, Codable, Hashable, CaseIterable {
		case positive
		case needsChanges = "needs_changes"
		case negative
	}
	
}
