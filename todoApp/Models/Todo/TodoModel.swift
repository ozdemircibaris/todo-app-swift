//
//  TodoModel.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import Foundation

struct TodoModel: Codable {
    var id: UUID
    var title: String
    var completed: Bool
}
