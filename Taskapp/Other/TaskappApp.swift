//
//  TaskappApp.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//


import FirebaseCore
import SwiftUI

@main
struct TaskappApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
