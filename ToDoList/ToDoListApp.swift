//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Amir Saulebekov on 7/22/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()

            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
