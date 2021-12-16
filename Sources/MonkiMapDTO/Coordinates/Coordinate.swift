//
//  Coordinate.swift
//  MonkiMapDTO
//
//  Created by Rémi Bardon on 24/08/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public struct Coordinate: Equatable, Hashable {
	
	/// The latitude component of a coordinate.
	///
	/// - Note: Allowed range is `-90...90`
	public struct Latitude: AngularMeasurement, ExpressibleByFloatLiteral {
		
		public static var positiveDirection: Character { "N" }
		
		public static var negativeDirection: Character { "S" }
		
		public let decimalDegrees: Double
		
		public var isValid: Bool { (-90.0...90.0).contains(self.decimalDegrees) }
		
		public init(decimalDegrees: Double) {
			self.decimalDegrees = decimalDegrees
		}
		
		public init(floatLiteral value: Double) {
			self.init(decimalDegrees: value)
		}
		
	}
	
	/// The longitude component of a coordinate.
	///
	/// - Note: Allowed range is `-180...180`
	public struct Longitude: AngularMeasurement, ExpressibleByFloatLiteral {
		
		public static var positiveDirection: Character { "E" }
		
		public static var negativeDirection: Character { "W" }
		
		public let decimalDegrees: Double
		
		public var isValid: Bool { (-180.0...180.0).contains(self.decimalDegrees) }
		
		public init(decimalDegrees: Double) {
			self.decimalDegrees = decimalDegrees
		}
		
		public init(floatLiteral value: Double) {
			self.init(decimalDegrees: value)
		}
		
	}
	
	public var latitude: Latitude
	public var longitude: Longitude
	
	public var isValid: Bool {
		return self.latitude.isValid && self.longitude.isValid
	}
	
	public init(latitude: Latitude, longitude: Longitude) {
		self.latitude = latitude
		self.longitude = longitude
	}
	
	public init(latitude: Double, longitude: Double) {
		self.init(
			latitude: Latitude(decimalDegrees: latitude),
			longitude: Longitude(decimalDegrees: longitude)
		)
	}
	
}

extension Coordinate: GeographicNotation {
	
	public func ddNotation() -> String {
		return "\(self.latitude.ddNotation()), \(self.longitude.ddNotation())"
	}
	
	public func dmNotation(full: Bool = false) -> String {
		return "\(self.latitude.dmNotation(full: full)), \(self.longitude.dmNotation(full: full))"
	}
	
	public func dmsNotation(full: Bool = false) -> String {
		return "\(self.latitude.dmsNotation(full: full)), \(self.longitude.dmsNotation(full: full))"
	}
	
}

#if canImport(CoreLocation)
import CoreLocation

extension Coordinate {
	
	public var clLocationCoordinate: CLLocationCoordinate2D {
		get {
			CLLocationCoordinate2D(
				latitude: self.latitude.decimalDegrees,
				longitude: self.longitude.decimalDegrees
			)
		}
		set {
			self.latitude = Latitude(decimalDegrees: newValue.latitude)
			self.longitude = Longitude(decimalDegrees: newValue.longitude)
		}
	}
	
}
#endif

extension Coordinate: Codable {
	
	internal enum CodingKeys: String, CodingKey {
		case latitude, longitude
	}
	
}
