//
//  AngularMeasurement.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/08/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public protocol AngularMeasurement: Hashable, Codable {
	
	/// "N" or "E" depending on axis
	static var positiveDirection: Character { get }
	
	/// "S" or "W" depending on axis
	static var negativeDirection: Character { get }
	
	var decimalDegrees: Double { get }
	
	init(decimalDegrees: Double)
	
}

extension AngularMeasurement {
	
	public var directionChar: Character {
		return self.decimalDegrees >= 0 ? Self.negativeDirection : Self.positiveDirection
	}
	
	/// `(dd - deg) * 60`
	public var minutes: Double {
		return decimalDegrees.fraction * 60
	}
	
	/// `(|(dd - deg) * 60| - min) * 60`
	public var seconds: Double {
		return minutes.fraction * 60
	}
	
	public init(degrees: Int, minutes: Double) {
		self.init(decimalDegrees: Double(degrees) + minutes / 60)
	}
	
	public init(degrees: Int, minutes: Int, seconds: Double) {
		self.init(degrees: degrees, minutes: Double(minutes) + seconds / 60)
	}
	
	/// Decimal Degree Notation
	public func ddNotation() -> String {
		return "\(decimalDegrees)"
	}
	
	/// Degree Minute Notation
	public func dmNotation(full: Bool = false) -> String {
		var parts = ["\(decimalDegrees.whole)°"]
		if full || minutes > 0 { parts.append("\(minutes)'") }
		parts.append("\(directionChar)")
		return parts.joined(separator: " ")
	}
	
	/// Degree Minute Second Notation
	public func dmsNotation(full: Bool = false) -> String {
		var parts = ["\(decimalDegrees.whole)°"]
		if full || minutes > 0 { parts.append("\(minutes.whole)'") }
		if full || seconds > 0 { parts.append("\(seconds)\"") }
		parts.append("\(directionChar)")
		return parts.joined(separator: " ")
	}
	
}

extension AngularMeasurement {
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let degrees = try container.decode(Double.self)
		self.init(decimalDegrees: degrees)
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.decimalDegrees)
	}
}
