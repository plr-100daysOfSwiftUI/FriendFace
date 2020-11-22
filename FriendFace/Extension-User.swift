//
//  Extension-User.swift
//  FriendFace
//
//  Created by Paul Richardson on 22/11/2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import Foundation

extension User {
	var wrappedName: String {
		name ?? "Unknown"
	}
	
	var wrappedCompany: String {
		company ?? "Unknown"
	}
	
	var wrappedFriends: Set<Friend> {
		friends as? Set ?? Set<Friend>()
	}
	
	var wrappedAge: Int {
		Int(age)
	}
	
	var shortFormatRegistered: String {
		if let date = registered {
			let formatter = DateFormatter()
			formatter.dateStyle = .short
			return formatter.string(from: date)
		} else {
			return "N/A"
		}
	}
}
