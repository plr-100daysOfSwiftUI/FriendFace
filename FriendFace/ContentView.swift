//
//  ContentView.swift
//  FriendFace
//
//  Created by Paul Richardson on 28.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State private var users = [User]()
	
	var body: some View {
		NavigationView {
			VStack {
				List {
					ForEach(self.users, id: \.self) { user in
						NavigationLink(destination: UserDetailView(user: user)) {
							HStack {
								Text("\(user.wrappedName)")
								Text("\(user.wrappedFriends.count) Friends")
									.foregroundColor(.secondary)
							}
						}
					}
				}
			}
			.navigationBarTitle("Friend Face")
			.navigationBarItems(trailing: Button("Load") {
				self.loadData()
			})
		}
	}
	
	func loadData() {
		let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
		let request = URLRequest(url: url)
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			guard let data = data else {
				return
			}
			
			let decoder = JSONDecoder()
			if let decodedData = try? decoder.decode([User].self, from: data) {
				self.users.append(contentsOf: decodedData)
			}
			
		}
		.resume()
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
