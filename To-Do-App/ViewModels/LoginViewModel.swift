//
//  LoginViewViewModel.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    init() {}
}
