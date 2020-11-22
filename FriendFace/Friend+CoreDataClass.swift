//
//  Friend+CoreDataClass.swift
//  FriendFace
//
//  Created by Paul Richardson on 29.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Friend)
public class Friend: NSManagedObject, Decodable {
	
	enum CodingKeys: CodingKey {
		case id, name
	}

	required public convenience init(from decoder: Decoder) throws {
		
		guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else {
			fatalError("Unable to obtain context")
		}
		
		guard let entity = NSEntityDescription.entity(forEntityName: "Friend", in: context) else {
			fatalError("Unable to obtain entity")
		}
		
		self.init(entity: entity, insertInto: context)
		
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		id = try container.decode(UUID.self, forKey: .id)
		name = try container.decode(String.self, forKey: .name)
	}
}
