//
//  ToDoListItemviewViewModel.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

///Esse arquivo é a visualizacao de apenas uma unica tarefa

class ToDoListItemviewViewModel: ObservableObject {
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("Tarefas")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
