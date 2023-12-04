//
//  LoginViewViewModel.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        // If the email-password is empty or contains only whitespace, the login process is halted.
        // trimmingCharacters(in: .whitespaces) removes all space characters at the beginning and end of a string.
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid e-mail address."
            return false
        }
        
        return true
    }
}
