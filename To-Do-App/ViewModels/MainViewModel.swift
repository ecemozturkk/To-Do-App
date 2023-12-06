//
//  MainViewViewModel.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currentUserID: String = ""
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
           DispatchQueue.main.async {
               self?.currentUserID = user?.uid ?? ""
           }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
