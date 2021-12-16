//
//  Page.swift
//  MonkiProjectsDTO
//
//  Created by Rémi Bardon on 04/05/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

/// A single section of a larger, traversable result set.
///
/// Comes from [Fluent](https://github.com/vapor/fluent-kit/blob/9d47c328bf83999968c12a3bc94ead1d706ad4a9/Sources/FluentKit/Query/Builder/QueryBuilder+Paginate.swift)
public struct Page<T>: Codable where T: Codable { // swiftlint:disable:this file_types_order
	
	/// The page's items. Usually models.
	public let items: [T]

	/// Metadata containing information about current page, items per page, and total items.
	public let metadata: PageMetadata

	/// Creates a new `Page`.
	public init(items: [T], metadata: PageMetadata) {
		self.items = items
		self.metadata = metadata
	}

	/// Maps a page's items to a different type using the supplied closure.
	public func map<U>(_ transform: (T) throws -> (U)) rethrows -> Page<U>
		where U: Codable
	{ // swiftlint:disable:this opening_brace
		try .init(
			items: self.items.map(transform),
			metadata: self.metadata
		)
	}
	
}

/// Metadata for a given `Page`.
///
/// Comes from [Fluent](https://github.com/vapor/fluent-kit/blob/9d47c328bf83999968c12a3bc94ead1d706ad4a9/Sources/FluentKit/Query/Builder/QueryBuilder+Paginate.swift)
public struct PageMetadata: Codable {
	
	/// Current page number. Starts at `1`.
	public let page: Int

	/// Max items per page.
	public let per: Int

	/// Total number of items available.
	public let total: Int
	
	/// Creates a new `PageMetadata` instance.
	///
	/// - Parameters:
	///   - page: Current page number.
	///   - per: Max items per page.
	///   - total: Total number of items available.
	public init(page: Int, per: Int, total: Int) {
		self.page = page
		self.per = per
		self.total = total
	}
	
}

/// Represents information needed to generate a `Page` from the full result set.
///
/// Comes from [Fluent](https://github.com/vapor/fluent-kit/blob/9d47c328bf83999968c12a3bc94ead1d706ad4a9/Sources/FluentKit/Query/Builder/QueryBuilder+Paginate.swift)
public struct PageRequest: Encodable {
	
	/// Page number to request. Starts at `1`.
	public let page: Int
	
	/// Max items per page.
	public let per: Int
	
	/// Creates a new `PageRequest`
	///
	/// - Parameters:
	///   - page: Page number to request. Starts at `1`.
	///   - per: Max items per page.
	public init(page: Int, per: Int) {
		self.page = page
		self.per = per
	}
	
}
