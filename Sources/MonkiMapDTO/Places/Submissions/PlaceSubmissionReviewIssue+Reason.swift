//
//  PlaceSubmissionReviewIssue+Reason.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Place.Submission.Review.Issue {
	
	public enum Reason: String, Codable, Hashable, CaseIterable {
		case name, coordinates, type, caption
		case satelliteImage = "satellite_image"
		case images, location, features
		case other
	}
	
}
