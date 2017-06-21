//
//  Firebase.swift
//  Pantry
//
//  Created by Justin Oroz on 6/20/17.
//  Copyright © 2017 Justin Oroz. All rights reserved.
//

import Foundation

public enum FirebaseType {
	case string(String)
	case bool(Bool)
	case number(NSNumber)
	case array(FireArray)
	case dictionary(FireDictionary)
}
