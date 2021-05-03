//
//  PlacemarkSubmission+State.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Submission {
	
	public enum State: String, Codable, Hashable {
		case waitingForReviews, needsChanges, waitingForChanges, accepted, rejected, moderated
	}
	
}
