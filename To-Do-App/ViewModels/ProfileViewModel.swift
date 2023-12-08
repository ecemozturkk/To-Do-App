//
//  ProfileViewViewModel.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    init() {}
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    print("Error fetching user data: \(String(describing: error))")
                    return
                }
                DispatchQueue.main.async {
                    self?.user = User(id: data["id"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
