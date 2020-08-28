//
//  User.swift
//  FriendFace
//
//  Created by Paul Richardson on 28.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import Foundation

struct User: Codable {
	var id: UUID
	var isActive: Bool
	var name: String
	var age: Int
	var company: String
	var email: String
	var address: String
	var about: String
	var registered: String
	var tags: [String]
	var friends: [Friend]
}
