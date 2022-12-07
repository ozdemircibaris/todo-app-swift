//
//  CreateTodoViewModel.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import Foundation

class CreateTodoViewModel: ObservableObject {
    var todoListVM: TodoListViewModel?
    var title: String = ""
    var completed: Bool = false
    
    func setup(_ todoListVM: TodoListViewModel) {
        self.todoListVM = todoListVM
    }
    
    func createTodo() {
        DispatchQueue.main.async {
            self.todoListVM?.todoList.append(TodoViewModel(todo: TodoModel(id: UUID(), title: self.title, completed: self.completed)))
        }
    }
}
