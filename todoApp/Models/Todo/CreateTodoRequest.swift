//
//  CreateTodoRequest.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import Foundation

struct CreateTodoRequest: Codable {
    var title: String
    var completed: Bool
}
