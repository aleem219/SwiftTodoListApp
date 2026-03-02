//
//  ListView.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import SwiftUI

struct ListView: View {
    @State var items:[String] = [
        "This is the first item!",
        "This is the second!",
        "Third!"
    ]
    var body: some View {
        List {
            ForEach(items,id: \.self) { item in
                ListRowView(tite: item)
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


