//
//  NewItemViewViewModel.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
    }
    
    func save() {
        guard canSave else {
            return
        }
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newItemID = UUID().uuidString
        let newItem = ToDoListItem(id: newItemID,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        let db = Firestore.firestore()
        db.collection("users").document(uID).collection("todos").document(newItem.id).setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
