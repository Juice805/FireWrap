//
//  FireDictionary.swift
//  FireWrap
//
//  Created by Justin Oroz on 6/20/17.
//  Copyright © 2017 Justin Oroz. All rights reserved.
//

import Foundation

public struct FireDictionary: Collection, ExpressibleByDictionaryLiteral, FireValue {
	private var raw = [Key: Value]()

	public typealias Key = String
	public typealias Value = FireValue
	public typealias Element =  Dictionary<String, FireValue>.Element
	public typealias Index = Dictionary<String, FireValue>.Index

	// MARK: init
	public init?(_ dict: [String : AnyObject]) {
		for element in dict {
			if let fbDict = FireDictionary(element.value) {
				self.raw[element.key] = fbDict
			} else if let fbArray = FireArray(element.value) {
				self.raw[element.key] = fbArray
			} else if let fbValue = element.value as? FireValue {
				self.raw[element.key] = fbValue
			} else {
				return nil
			}
		}
	}

	public init?(_ item: Any?) {
		guard let dictionary = item as? [String: AnyObject] else {
			return nil
		}
		self.init(dictionary)
	}

	public init(dictionaryLiteral elements: (Key, Value)...) {
		elements.forEach({raw[$0.0] = $0.1})
	}

	// MARK: Collection Protocol
	public subscript(position: Index) -> Element {
		return raw[position]
	}

	public subscript(key: Key) -> Value? {
		get {
			return raw[key]
		}
		set {
			raw[key] = newValue
		}
	}

	public var startIndex: Dictionary<Key, Value>.Index {
		return raw.startIndex
	}

	public var endIndex: Index {
		return raw.endIndex
	}

	public func index(after index: Index) -> Index {
		return raw.index(after: index)
	}

	// MARK: FireValue Protocol
	public var type: FirebaseType {
		return .dictionary(self)
	}

	public var uploadable: AnyObject {
		var uploadable = [String: AnyObject]()

		raw.forEach({uploadable[$0.key] = $0.value.uploadable})

		return uploadable as NSDictionary
	}

	// MARK: String Convertible Protocol
	public var description: String {
		return raw.description
	}

	public var debugDescription: String {
		return raw.debugDescription
	}

	// MARK: Dictionary Methods
	public var keys: Dictionary<Key, Value>.Keys {
		return raw.keys
	}

}
