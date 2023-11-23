//
//  ToDoListViewViewModel.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import FirebaseFirestore
import Foundation

//crud
//create read unscribe delete

/// ViewModel para uma lista de tarefas cadastradas (engloba todas as tarefas)

class ToDoListViewViewModel: ObservableObject {
    
    //faz aparecer para criar a tarefa
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete item da lista
    /// - Parameter id: id do item que devemos deletar
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("Tarefas")
            .document(id)
            .delete()
        
        print("Item deletado")
        
    }
}
