//
//  ToDoListItemViewViewModel.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel : ObservableObject {

    init(){}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(item.id).setData(itemCopy.asDictionary())
    }
}
