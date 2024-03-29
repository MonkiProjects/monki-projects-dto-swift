//
//  FloatingPoint+Fraction.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/08/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

/// Comes from [Getting the decimal part of a double in Swift](https://stackoverflow.com/a/55010456/10967642)
extension FloatingPoint {
	var whole: Self { modf(self).0 }
	var fraction: Self { modf(self).1 }
}
