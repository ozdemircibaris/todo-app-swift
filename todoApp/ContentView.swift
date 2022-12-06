//
//  ContentView.swift
//  todoApp
//
//  Created by 10lift on 6.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TodoListScreen()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
