//
//  PlacemarkSubmissionReview+Create.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 11/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Submission.Review {
	
	public struct Create: Codable, Hashable {
		
		public let opinion: Opinion
		public let comment: String?
		// TODO: For some reason, not providing an "issues" array causes
		//       "issues failed to decode: keyNotFound(issues,
		//       Swift.DecodingError.Context(codingPath: [],
		//       debugDescription: \"Cannot get UnkeyedDecodingContainer --
		//       no value found for key issues (\\\"issues\\\")\", underlyingError: nil))"
		//       Probably caused by Vapor's Content decoding, because no validation error happens
		public let issues: [Issue.Create]?
		public let moderated: Bool?
		
		public init(
			opinion: Opinion,
			comment: String? = nil,
			issues: [Issue.Create]? = nil,
			moderated: Bool? = nil
		) {
			self.opinion = opinion
			self.comment = comment
			self.issues = issues
			self.moderated = moderated
		}
		
	}
	
}
