//
//  NewItemView.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import SwiftUI

struct NewItemView: View {
    
    @Binding var newItemPresented: Bool
    @StateObject var viewModel = NewItemViewModel()
    
    var body: some View {
        VStack {
            Text("New To Do")
                .font(.title)
                .bold()
                .padding(.top, 100)
            Form {
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: .date).datePickerStyle(.graphical)
                BigButton(title: "Add") {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please enter a valid title and date."))
            })
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))
    }
}
