//
//  ListView.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import SwiftUI

struct ListView: View {
    @State var items:[ItemModel] = [
        ItemModel(title:  "This is the first title!", isCompleted: false),
        ItemModel(title:  "This is the second!", isCompleted: true),
        ItemModel(title:  "Third!", isCompleted: false),
    ]
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}


