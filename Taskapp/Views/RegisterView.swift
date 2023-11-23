//
//  RegisterView.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack{
            
            Image("screen")
                .frame(width: 400 , height: 350)
                .background(Color.black)
            
            //formulario de cadastro
            
            Form{
                TextField("Nome Completo", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .foregroundColor(Color.black)
                
                TextField("E-mail", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .foregroundColor(.black)
                
                SecureField("Senha", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //BUTTON CRIAR CONTA
                TLButton(
                    title: "Criar conta",
                    background: .green){
                        print("botao de cadastro pressionado")
                        viewModel.register()
                    }
                
            }
        }
    }
    
}


#Preview {
    RegisterView()
}
