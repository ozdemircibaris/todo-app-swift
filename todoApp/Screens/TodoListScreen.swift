//
//  TodoListScreen.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import SwiftUI

struct TodoListScreen: View {
    @EnvironmentObject var todoListVM: TodoListViewModel

    var body: some View {
        VStack {
            Button("Create todo") {
                todoListVM.createTodo(createTodoRequest: CreateTodoRequest(title: "", completed: false))
            }
            TodoListView()
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
    }
}

struct TodoListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoListScreen()
    }
}
