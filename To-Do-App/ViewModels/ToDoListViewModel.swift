//
//  ToDoListViewViewModel.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel : ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    /// Delete to do list item
    ///  - Parameter id: Item id to delete
    func delete(id:String) {
        let db = Firestore.firestore()
        db.collection("users").document(userID).collection("todos").document(id).delete()
    }
}
