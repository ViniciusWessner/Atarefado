//
//  NewItemViewViewModel.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//
import FirebaseAuth
import FirebaseFirestore

import Foundation

class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    init(){}
    
    func save(){
        guard canSave else {
            return
        }
        
        //Resgatar o ID do usuario
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Modelo e formatacao de envio dos itens pro banco de dados
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        
        //salvando os itens no banco de dados
        let db = Firestore.firestore()
        db.collection("users") //nome do banco
            .document(uId)
            .collection("Tarefas") //nome da tabela
            .document(newId)
            .setData(newItem.asDictionary())
        //chamamos o dicionario de itens e em seguida chamamos a extension asDictionary q converte
        
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
