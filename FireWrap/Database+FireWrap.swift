
//
//  Firebase+FireWrap.swift
//  FireWrap
//
//  Created by Justin Oroz on 6/21/17.
//  Copyright © 2017 Justin Oroz. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DatabaseQuery {

	func queryEqual(_ toValue: FireValue?) {
		self.queryEqual(toValue: toValue?.uploadable)
	}

	func queryEqual(_ toValue: FireValue, childKey: String?) {
		self.queryEqual(toValue: toValue.uploadable, childKey: childKey)
	}

	func queryEnding(atValue endValue: FireValue?) -> DatabaseQuery {
		return self.queryEnding(atValue: endValue?.uploadable)
	}

	func queryEnding(atValue endValue: FireValue?, childKey: String?) -> DatabaseQuery {
		return self.queryEnding(atValue: endValue?.uploadable, childKey: childKey)
	}

	func queryEqual(toValue value: FireValue?) -> DatabaseQuery {
		return self.queryEqual(toValue: value?.uploadable)
	}

	func queryEqual(toValue value: FireValue?, childKey: String?) -> DatabaseQuery {
		return self.queryEqual(toValue: value?.uploadable, childKey: childKey)
	}


}

extension DatabaseReference {
	// MARK: SetValue
	public func setValue(_ value: FireValue?) {
		self.setValue(value?.uploadable)
	}

	func setValue(_ value: FireValue?, withCompletionBlock block: @escaping (Error?, DatabaseReference) -> Void) {
		self.setValue(value?.uploadable, withCompletionBlock: block)
	}

	func setValue(_ value: FireValue?, andPriority priority: Any?) {
		self.setValue(value?.uploadable, andPriority: priority)
	}

	func setValue(_ value: FireValue?, andPriority priority: Any?, withCompletionBlock block: @escaping (Error?, DatabaseReference) -> Void) {

	}

}
