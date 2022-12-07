//
//  CreateTodoScreen.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import SwiftUI

struct CreateTodoScreen: View {
    @EnvironmentObject var createTodoVM: CreateTodoViewModel
    @EnvironmentObject var todoListVM: TodoListViewModel
    
    var body: some View {
        VStack {
            TextField("title")
        }
    }
}

struct CreateTodoScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoScreen()
    }
}
