//
//  PlaceSubmissionReviewIssue+State.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission.Review.Issue {
	
	public enum State: String, Codable, Hashable, CaseIterable {
		case submitted, addressed, denied
	}
	
}
