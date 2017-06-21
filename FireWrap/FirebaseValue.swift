//
//  FireValue.swift
//  FireWrap
//
//  Created by Justin Oroz on 6/20/17.
//  Copyright © 2017 Justin Oroz. All rights reserved.
//

import Foundation

public protocol FireValue: CustomDebugStringConvertible, CustomStringConvertible, Any {
	var type: FirebaseType {get}
	var uploadable: AnyObject {get}
}

// MARK: - Protocol Extensions

extension String: FireValue {

	public var uploadable: AnyObject {
		return self as NSString
	}

	public var type: FirebaseType {
		return .string(self)
	}
}

extension NSString: FireValue {
	public var uploadable: AnyObject {
		return self
	}

	public var type: FirebaseType {
		return .string(self as String)
	}
}

extension Bool: FireValue {
	public var debugDescription: String {
		return self ? "true" : "false"
	}

	public var uploadable: AnyObject {
		return self as AnyObject
	}

	public var type: FirebaseType {
		return .bool(self)
	}
}

extension NSNumber: FireValue {
	public var uploadable: AnyObject {
		return self
	}

	public var type: FirebaseType {
		return .number(self)
	}
}
