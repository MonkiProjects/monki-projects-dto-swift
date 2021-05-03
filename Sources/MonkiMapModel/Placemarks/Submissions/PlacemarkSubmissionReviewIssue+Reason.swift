//
//  PlacemarkSubmissionReviewIssue+Reason.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Submission.Review.Issue {
	
	public enum Reason: String, Codable, Hashable {
		case name, coordinates, type, caption, satelliteImage, images, location, properties, other
	}
	
}

/// Extend for testing purposes
extension Placemark.Submission.Review.Issue.Reason: CaseIterable {}
