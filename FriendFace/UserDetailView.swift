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
				Text("\(user.wrappedName)")
					.font(.largeTitle)
				Text("Aged \(user.age), works for \(user.wrappedCompany)")
					.font(.headline)
				Text(user.wrappedTags)
					.foregroundColor(.secondary)
			}
			.padding()
			
			Section(header: Text("\(user.wrappedFriends.count) friends")) {
				List {
					ForEach(Array(user.wrappedFriends)) { friend in
						NavigationLink(destination: FriendDetailView(friend: friend)) {
								Text("\(friend.wrappedName)")
						}
					}
				}
			}
			
			
			Spacer()
			
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
