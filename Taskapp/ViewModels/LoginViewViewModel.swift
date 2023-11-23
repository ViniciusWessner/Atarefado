//
//  LoginViewViewModel.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var erroMessage = ""
    
    init(){}
    
    func login() {
        guard validade() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)

        
    }
    
    func validade() -> Bool{
        
        erroMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            erroMessage = "Preencha todos os campos"
            return false
            
            //validando e-mail (email@ifoo.com)
            guard email.contains("@") && email.contains(".") else {
                erroMessage = "Insira um e-mail valido"
                return false
            }
            
            print("Passou na validadao do login")
            
        }
        
        return true
        
    }
    
}
