//
//  FireArray.swift
//  FireWrap
//
//  Created by Justin Oroz on 6/20/17.
//  Copyright © 2017 Justin Oroz. All rights reserved.
//

import Foundation

public struct FireArray: RandomAccessCollection, MutableCollection, _DestructorSafeContainer, FireValue {
	fileprivate var raw = [FireValue]()

	public typealias Element =  Array<FireValue>.Element
	public typealias Index = Array<FireValue>.Index

	// MARK: init
	public init?(_ array: [AnyObject]) {
		for element in array {
			if let fbDict = FireDictionary(element) {
				self.raw.append(fbDict)
			} else if let fbArray = FireArray(element) {
				self.raw.append(fbArray)
			} else if let fbValue = element as? FireValue {
				self.raw.append(fbValue)
			} else {
				return nil
			}
		}
	}

	public init?(_ item: Any?) {
		guard let array = item as? [AnyObject] else {
			return nil
		}
		self.init(array)
	}

	// MARK: Collection Protocol
	public subscript(index: Index) -> Element {
		get {
			return raw[index]
		}
		set {
			raw[index] = newValue
		}
	}

	public var startIndex: Index {
		return raw.startIndex
	}

	public var endIndex: Index {
		return raw.endIndex
	}

	public func index(after index: Index) -> Index {
		return raw.index(after: index)
	}

	public func index(before index: Index) -> Index {
		return raw.index(before: index)
	}

	// MARK: FireValue Protocol
	public var type: FirebaseType {
		return .array(self)
	}

	public var uploadable: AnyObject {
		var uploadable = [AnyObject]()

		for item in raw {
			uploadable.append(item.uploadable)
		}

		return uploadable as NSArray
	}

	// MARK: String Convertible Protocol
	public var description: String {
		return raw.description
	}

	public var debugDescription: String {
		return raw.debugDescription
	}

	// MARK: Array Methods
	public mutating func append(_ new: FireValue) {
		self.raw.append(new)
	}
}
