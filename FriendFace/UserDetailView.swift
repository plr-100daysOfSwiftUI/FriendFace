//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Paul Richardson on 28.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
	
	let user: User
	
	var body: some View {
		
		VStack	{
			
			Group {
				Text("\(user.name)")
					.font(.largeTitle)
				Text("\(user.age)")
					.font(.headline)
				Text("\(user.company)")
					.font(.headline)
			}
			
			List {
				ForEach(user.friends, id: \.self) { friend in
					Text("\(friend.name)")
				}
			}
			
		}
		.padding()
	}
}


struct UserDetailView_Previews: PreviewProvider {
	static var previews: some View {
		// TODO: Provide a User to preview
		//		UserDetailView()
		Text("Hallo World!")
	}
}
