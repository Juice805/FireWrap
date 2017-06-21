//
//  FireSnapshot.swift
//  FireWrap
//
//  Created by Justin Oroz on 6/21/17.
//  Copyright © 2017 Justin Oroz. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DataSnapshot {

	var fire: FireValue? {
		if let fbDict = FireDictionary(self.value) {
			return fbDict
		} else if let fbArray = FireArray(self.value) {
			return fbArray
		} else if let fbValue = self.value as? FireValue {
			return fbValue
		} else {
			return nil
		}
	}
}
