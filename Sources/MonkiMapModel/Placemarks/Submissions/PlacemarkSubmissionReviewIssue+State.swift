//
//  PlacemarkSubmissionReviewIssue+State.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Submission.Review.Issue {
	
	public enum State: String, Codable, Hashable {
		case submitted, addressed, denied
	}
	
}

/// Extend for testing purposes
extension Placemark.Submission.Review.Issue.State: CaseIterable {}
