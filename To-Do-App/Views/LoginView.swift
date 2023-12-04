//
//  LoginView.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView()
                
                // List (email, password, button)
                List {
                    TextField("E-mail", text: $email)
                    SecureField("Password", text: $password)
                }
                .listStyle(PlainListStyle()) // List stilini düz bir liste olarak ayarla
                .frame(height: 150)
                .padding(.horizontal)
                
                Button(action: {}, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.primary)
                        Text("Login")
                            .foregroundStyle(.white)
                    }
                })
                .frame(width: 300, height: 50)
                .padding(.horizontal)
                
                Spacer()
                
                // Footer (doesn't have account?)
                VStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: RegisterView()) {
                        Text("Sign up")
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
