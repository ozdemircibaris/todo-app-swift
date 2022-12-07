//
//  TodoListViewModel.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoList: [TodoViewModel] = [TodoViewModel]()

    func createTodo(createTodoRequest: CreateTodoRequest) {
        todoList.append(TodoViewModel(todo: TodoModel(id: UUID(), title: createTodoRequest.title, completed: createTodoRequest.completed)))
    }
    
    func completeTodo(todoId: String, completed: Bool) {
        if let itemIndex = todoList.firstIndex(where: { $0.id == todoId }) {
            todoList[itemIndex].completed = completed
        }
    }
    
    func deleteTodo(todoId: String) {
        let filteredTodos = todoList.filter { $0.id != todoId }
        todoList = filteredTodos
    }
    
    func duplicateTodo(todoId: String) {
        if let item = todoList.first(where: { $0.id == todoId }) {
            createTodo(createTodoRequest: CreateTodoRequest(title: item.title, completed: item.completed))
            
        }
    }
}
