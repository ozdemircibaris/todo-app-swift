//
//  TodoListView.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import SwiftUI

enum FocusField: Hashable {
    case none
    case row(index: Int)
}

struct TodoListView: View {
    @EnvironmentObject var todoListVM: TodoListViewModel
    @State var isHover: Bool = false
    @FocusState private var focusedField: FocusField?
    @State var focusedIndex: Int = 0
    
    
    func deleteTodo(todoId: String) {
        todoListVM.deleteTodo(todoId: todoId)
    }
    
    func duplicateTodo(todoId: String) {
        todoListVM.duplicateTodo(todoId: todoId)
    }
    
    func onMove(from source: IndexSet, to destination: Int) {
        todoListVM.moveTodo(source: source, destionation: destination)
    }
    
    func handleNextTextField(todoIndex: Int) {
        // get the current index
        // current index + 1 and check the next item avability
        // if next item avaible ? focused next item else add new item
        let nextItemIndex = todoIndex + 1
        if self.todoListVM.todoList.indices.contains(nextItemIndex) {
            focusedField = .row(index: nextItemIndex)
        } else {
            todoListVM.createTodo(createTodoRequest: CreateTodoRequest(title: "", completed: false))
            focusedField = .row(index: nextItemIndex)
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(todoListVM.todoList.indices, id: \.self) { index in
                    let todo = todoListVM.todoList[index];

                    HStack {
                        Image(systemName: "line.3.horizontal")
                            .onHover { hover in
                                isHover = hover
                            }
                        // completed
                        Button(action:
                                {
                            todoListVM.completeTodo(todoId: todo.id, completed: !todo.completed)
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 1, style: .continuous)
                                    .fill(todo.completed ? Color.purple:Color.black)
                                    .frame(width: 20, height: 20)
                                    .border(Color.purple, width: 2).cornerRadius(4)
                                if todo.completed {
                                    Image(systemName: "checkmark").zIndex(1)
                                }
                            }.frame(width: 20, height: 20)
                        }.foregroundColor(Color.white)
                            .buttonStyle(PlainButtonStyle())
                        
                        // title
                        VStack {
                            TextField("Type title", text: self.$todoListVM.todoList[index].title)
                                .textFieldStyle(PlainTextFieldStyle())
                                .focused($focusedField, equals: .row(index: index))
                                .onSubmit {
                                    handleNextTextField(todoIndex: index)
                                }
                            
                            Divider()
                                .frame(height: 1)
                                .padding(.horizontal, 30)
                                .background(Color.gray)
                        }
                        
                        // action button
                        Menu {
                            Button("Delete") {
                                deleteTodo(todoId: todo.id)
                            }
                            Button("Duplicate", action: {
                                duplicateTodo(todoId: todo.id)
                            })
                        } label: {
                            Image(systemName: "bookmark.circle")
                                .resizable()
                                .frame(width:24.0, height: 24.0)
                        }.frame(width: 30, alignment: .center)
                            .menuIndicator(.hidden)
                            .moveDisabled(true)
                    }
                    
                }.onMove(perform: onMove)
                    .moveDisabled(!isHover)
            }
        }
    }
}
