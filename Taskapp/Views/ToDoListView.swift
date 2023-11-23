//
//  ToDoListItemsView.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userId: String){
        ///ESTRUTURA DO BANCO
        // users/<id>/tarefas/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/Tarefas")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button {
                                //button delete
                                viewModel.delete(id: item.id)
                            } label: {
                                Image(systemName: "trash")
                                    .tint(.red)
                            }
                    }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("Lista de Tarefas")
            .toolbar {
                Button{
                    //action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
            
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }

    }
}

#Preview {
    ToDoListView(userId: "J71LvoWfUAh2H0RJBhLxme4wQIk2")
}
