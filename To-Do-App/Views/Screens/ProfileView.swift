//
//  ProfileView.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    init() {}
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    VStack {
                        Text("Loading...")
                        ProgressView()
                    }
                    .padding(.bottom, 25)
                }

                BigButton(title: "Logout") {viewModel.logout()}
            }
            .navigationTitle("Profile")
        }
        .onAppear() {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user:User) -> some View {
        Image(systemName: "person.circle")
            .font(.system(size: 100))
            .foregroundStyle(Color.blue)
            .padding()
        
        VStack {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            HStack {
                Text("Joined: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
