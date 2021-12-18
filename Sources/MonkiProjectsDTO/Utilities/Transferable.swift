//
//  Transferable.swift
//  MonkiProjectsDTO
//
//  Created by Rémi Bardon on 18/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public protocol Transferable {
	
	/// An enumeration containing types that will be sent to / received by the API.
	associatedtype DTO
	
}
