//
//  LoginView.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewmodel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //header
                Image("screen")
                    .frame(width: UIScreen.main.bounds.width * 3, height: 350)
//                HeaderView(title: "App Task",
//                           subtitle: "Seu aplicativo de tarefas diárias",
//                           angle: 12,
//                           background: .pink)
                //login form
                
                Form {
                    if !viewmodel.erroMessage.isEmpty{
                        Text(viewmodel.erroMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email", text: $viewmodel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)

                    SecureField("Senha", text: $viewmodel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Entrar", background: .blue){
                        //TODO: Criar funcao de login
                        viewmodel.login()
                    }
                    
                }.offset(y: -100)
                
                VStack{
                    Text("Ainda nao possui um cadastro?")
                    NavigationLink("Criar uma conta", destination: RegisterView())
                }
                
                Spacer()
            }
        }
        
    }
}


#Preview {
    LoginView()
}
