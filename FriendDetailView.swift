//
//  FriendDetailView.swift
//  FriendFace
//
//  Created by Paul Richardson on 22/11/2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI

struct FriendDetailView: View {
	
	let friend: Friend
	
	var body: some View {
		Text("\(friend.wrappedName) is the friend of \(friend.friendCount) users.")		
	}
}

struct FriendDetailView_Previews: PreviewProvider {
	static var previews: some View {
//		TODO: Provide a Friend for preview
//		FriendDetailView()
		Text("Hallo, Friend!")
	}
}
