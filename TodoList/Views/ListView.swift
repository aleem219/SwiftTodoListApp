//
//  ListView.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import SwiftUI

/*
 CRUD FUNCTION
 
 CREATE
 READ
 UPDATE
 DELETE
 
 */

struct ListView: View {
    
    @EnvironmentObject var  listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item).onTapGesture {
                    withAnimation(.linear) {
                        listViewModel.updateItem(item: item)
                    }
                }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
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
    .environmentObject(ListViewModel())
}


