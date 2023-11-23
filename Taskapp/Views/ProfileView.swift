//
//  ProfileView.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                }  else {
                    
                    Text("Buscando informacoes...")
                }
                
            }
            .navigationTitle("Perfil")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
            //avatar
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 125, height: 125)
            
                .padding()
            
            //info: email, nome, member since
            VStack(alignment: .leading){
                
                HStack{
                    Text("Name: ")
                        .bold()
                    Text(user.name)
                }
                
                HStack{
                    Text("email: ")
                        .bold()
                    Text(user.email)
                }
                
                HStack{
                    Text("Data de cadastro: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
            }
                
                //button de sair do app
                Button("Sair") {
                    //actoion de sair
                    viewModel.logOut()
                }
                .tint(.red)
                .padding()
                
                Spacer()
                
            
            
        }
    }


#Preview {
    ProfileView()
}
