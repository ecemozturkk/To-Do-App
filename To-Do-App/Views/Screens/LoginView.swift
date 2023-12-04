//
//  LoginView.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView()
                
                // List (email, password, button)
                List {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("E-mail", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                }
                .listStyle(PlainListStyle()) // List stilini düz bir liste olarak ayarla
                .frame(height: 200)
                .padding(.horizontal)
                
                BigButton(title: "Login") {
                    viewModel.login()
                }

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
