//
//  todoAppApp.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import SwiftUI

@main
struct todoApp: App {
    @StateObject var todoListVM: TodoListViewModel = TodoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(todoListVM)
        }
    }
}
