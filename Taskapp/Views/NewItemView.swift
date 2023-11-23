//
//  NewItemView.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    
    var body: some View {
        VStack{
            Text("Adicionar nova tarefa")
                .font(.system(size: 32))
                .bold()
                .padding(20)
            
            Form{
                // titulo
                TextField("Descricao da tarefa", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                
                //data da tarefa
                DatePicker("Data da Tarefa", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //estrutura do botao de criar tarefa
                TLButton(title: "Salvar",
                         background: .yellow){
                    //action do buton de salvar aqui
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Atencao"),
                            message: Text("Por favor, insira um título para a sua tarefa e selecione uma data correspondente."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
