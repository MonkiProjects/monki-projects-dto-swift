//
//  AngularMeasurement.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 24/08/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public protocol AngularMeasurement: Hashable, Codable, GeographicNotation {
	
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
		return abs(decimalDegrees.fraction) * 60
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
	
}

// MARK: - GeographicNotation

extension AngularMeasurement {
	
	/// Decimal Degree Notation
	public func ddNotation() -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = 6
		return formatter.string(from: NSNumber(value: decimalDegrees)) ?? "\(decimalDegrees)"
	}
	
	/// Degree Minute Notation
	public func dmNotation(full: Bool = false) -> String {
		// Degree
		var parts = ["\(Int(decimalDegrees.whole))°"]
		
		// Minute
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = 3
		if full || minutes > 0, let string = formatter.string(from: NSNumber(value: minutes)) {
			parts.append("\(string)'")
		}
		
		parts.append("\(directionChar)")
		return parts.joined(separator: " ")
	}
	
	/// Degree Minute Second Notation
	public func dmsNotation(full: Bool = false) -> String {
		// Degree
		var parts = ["\(Int(decimalDegrees.whole))°"]
		
		// Minute
		if full || minutes > 0 { parts.append("\(Int(minutes.whole))'") }
		
		// Second
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = 1
		if full || seconds > 0, let string = formatter.string(from: NSNumber(value: seconds)) {
			parts.append("\(string)\"")
		}
		
		parts.append("\(directionChar)")
		return parts.joined(separator: " ")
	}
	
}

// MARK: - Codable

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
