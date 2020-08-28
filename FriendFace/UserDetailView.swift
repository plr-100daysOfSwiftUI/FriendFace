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
				Text("Aged \(user.age), works for \(user.company)")
					.font(.headline)
			}
			.padding()
			
			Section(header: Text("\(user.friends.count) friends")) {
				List {
					ForEach(user.friends, id: \.self) { friend in
						Text("\(friend.name)")
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
