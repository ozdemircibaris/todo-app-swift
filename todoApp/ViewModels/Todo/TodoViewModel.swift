//
//  TodoViewModel.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import Foundation

struct TodoViewModel: Identifiable {
    var todo: TodoModel
    var id: String {
        get {
            return todo.id.uuidString
        }
        set {
            todo.id = UUID()
        }
    }

    var title: String {
        get {
            return todo.title
        }
        set(title) {
            todo.title = title
        }
    }

    var completed: Bool {
        get {
            return todo.completed
        }
        set(completed) {
            todo.completed = completed
        }
    }
}
