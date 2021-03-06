//
//  ContentView.swift
//  FriendFace
//
//  Created by Paul Richardson on 28.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)]) var users: FetchedResults<User>
	
	@State private var dataLoaded = false
	
	var body: some View {
		
		NavigationView {
			VStack {
				if dataLoaded || !users.isEmpty {
					List {
						ForEach(self.users, id: \.self) { user in
							NavigationLink(destination: UserDetailView(user: user)) {
								VStack(alignment: .leading) {
									Text("\(user.wrappedName)")
									Group {
										Text("Age: \(user.wrappedAge)")
										Text("Date Registered: \(user.shortFormatRegistered)")
									}
									.foregroundColor(.secondary)
								}
							}
						}
					}
				} else {
					Button("Load Data") {
						self.loadData()
					}
				}
				
			}
			.navigationBarTitle("Friend Face")
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
			
			decoder.userInfo[CodingUserInfoKey.context!] = self.moc
			decoder.dateDecodingStrategy = .iso8601
			
			if let _ = try? decoder.decode([User].self, from: data) {
				if self.moc.hasChanges {
					try? self.moc.save()
					self.dataLoaded = true
				}
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
