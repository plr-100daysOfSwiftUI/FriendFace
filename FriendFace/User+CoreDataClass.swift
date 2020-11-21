//
//  User+CoreDataClass.swift
//  FriendFace
//
//  Created by Paul Richardson on 29.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Decodable, Identifiable {
	
	enum CodingKeys: CodingKey {
		case about, address, age, company, email, id, isActive, name, registered, tags, friends
	}
	
	required convenience public init(from decoder: Decoder) throws {
		
		guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else {
			fatalError("Unable to obtain context")
		}
		
		guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else {
			fatalError("Unable to obtain entity")
		}

		self.init(entity: entity, insertInto: context)
		
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		about = try container.decode(String.self, forKey: .about)
		address = try container.decode(String.self, forKey: .address)
		age = try container.decode(Int16.self, forKey: .age)
		company = try container.decode(String.self, forKey: .company)
		email = try container.decode(String.self, forKey: .email)
		id = try container.decode(UUID.self, forKey: .id)
		isActive = try container.decode(Bool.self, forKey: .isActive)
		name = try container.decode(String.self, forKey: .name)
		registered = try container.decode(String.self, forKey: .registered)
		tags = try container.decode([String].self, forKey: .tags) as NSObject
		friends = try container.decode(Set<Friend>.self, forKey: .friends) as NSSet
	}
	
}
