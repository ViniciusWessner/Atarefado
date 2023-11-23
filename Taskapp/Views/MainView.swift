//
//  ContentView.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        }else{
            //caso nao estiver logado
            LoginView()
        }
        
        
    }
    
    @ViewBuilder var accountView: some View {
        TabView{
            //caso estiver logado no app
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.circle")
                }
        }
    }
    
}

#Preview {
    MainView()
}
