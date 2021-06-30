//
//  PlaceSubmission+State.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission {
	
	public enum State: String, Codable, Hashable {
		case waitingForReviews = "waiting_for_reviews"
		case needsChanges = "needs_changes"
		case waitingForChanges = "waiting_for_changes"
		case accepted
		case rejected
		case moderated
	}
	
}
