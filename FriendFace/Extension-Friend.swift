//
//  Extension-Friend.swift
//  FriendFace
//
//  Created by Paul Richardson on 22/11/2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import Foundation

extension Friend {
	var wrappedName: String {
		name ?? "Unknown"
	}
	
	var friendCount: Int {
		users?.count ?? 0
	}
}
