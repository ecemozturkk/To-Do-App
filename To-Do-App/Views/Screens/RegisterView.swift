//
//  RegisterView.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView()
                
                // Register form
                List {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("Full name", text: $viewModel.name)
                        .autocorrectionDisabled()
                    TextField("E-mail", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                }
                .listStyle(PlainListStyle())
                .frame(height: 200)
                .padding(.horizontal)
                
                BigButton(title: "Register") {
                    viewModel.register()
                }
                
                Spacer()
                
                // Footer
                VStack {
                    Text("Already have an account?")
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
