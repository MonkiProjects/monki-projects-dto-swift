//
//  Place+Feature.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 11/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

// MARK: - Protocols

public protocol PlaceFeatureWithIcon {
	
	var id: Place.Feature.ID { get }
	var kind: Place.Feature.Kind { get }
	var isSystemDefined: Bool { get }
	var iconUrl: URL? { get }
	
}

extension PlaceFeatureWithIcon {
	
	/// Returns true if path matches `**/assets/features/system/*` like
	/// `https://cdn.monkiprojects.com/assets/features/system/big-wall.png`.
	private var hasSystemIcon: Bool {
		return iconUrl?.pathComponents.dropLast(1).suffix(3) == ["assets", "features", "system"]
	}
	
}

// MARK: - Models

extension Place {
	
	public struct Feature: Identifiable, Hashable, Codable {
		
		public typealias ID = String
		
		public let id: ID
		public let kind: Kind
		
		public init(id: ID, kind: Kind) {
			self.id = id
			self.kind = kind
		}
		
	}
	
}

extension Place.Feature {
	
	/// The kind of a place feature.
	/// - See: [Terminology for users > Place features](https://docs.monkiprojects.com/terminology-for-users.html#place-features)
	public enum Kind: String, Codable, Hashable, CaseIterable, DefaultCaseDecodable {
		
		public static var defaultCase: Self = .unknown
		
		/// Place elements are what you can find on a [place](https://docs.monkiprojects.com/terminology-for-users.html#places).
		/// It can be walls, barriers, trees… as long as it’s useful for practicing.
		/// Most of the time it can be related to a [component](https://docs.monkiprojects.com/terminology-for-users.html#place-components).
		/// - See: [Terminology for users > Place elements](https://docs.monkiprojects.com/terminology-for-users.html#place-elements)
		case element
		
		/// A technique one could train on a place.
		case technique
		
		/// A benefit some place could have.
		case benefit
		
		/// A hazard you might encounter on a place.
		case hazard
		
		/// Unknown case for backward compatibility.
		case unknown
		
	}
	
}

extension Place.Feature {
	
	/// An enumeration containing types that will be sent to / received by the API.
	public enum DTO {}
	
}

extension Place.Feature.Kind {
	
	/// An enumeration containing types that will be sent to / received by the API.
	public enum DTO {}
	
}

// MARK: - Comparators

public struct PlaceFeatureKindComparator: SortComparator {
	
	public typealias Compared = Place.Feature.Kind
	
	public var order: SortOrder
	
	public func compare(_ lhs: Compared, _ rhs: Compared) -> ComparisonResult {
		let lhsi = Compared.allCases.firstIndex(of: lhs)!
		let rhsi = Compared.allCases.firstIndex(of: rhs)!
		
		let compared: (Int, Int)
		switch order {
		case .forward:
			compared = (lhsi, rhsi)
		case .reverse:
			compared = (rhsi, lhsi)
		}
		
		switch compared {
		case let (a, b) where a<b:
			return .orderedAscending
		case let (a, b) where a>b:
			return .orderedDescending
		default:
			return .orderedSame
		}
	}
	
}
