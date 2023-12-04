//
//  RegisterView.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView()
                
                // Register form
                List {
                    TextField("Full name", text: $name)
                        .autocorrectionDisabled()
                    TextField("E-mail", text: $email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                }
                .listStyle(PlainListStyle()) // List stilini düz bir liste olarak ayarla
                .frame(height: 150)
                .padding(.horizontal)
                
                BigButton(title: "Register", action: {})
                
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
