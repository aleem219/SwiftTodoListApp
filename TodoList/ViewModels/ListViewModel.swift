//
//  ListViewModel.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import Foundation

/*
 CRUD FUNCTION
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject {
    @Published var items:[ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
       getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title:  "This is the first title!", isCompleted: false),
//            ItemModel(title:  "This is the second!", isCompleted: true),
//            ItemModel(title:  "Third!", isCompleted: false),
//        ]
//        
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from:IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
//       if let index = items.firstIndex { (existingItems) -> Bool in
//            return existingItems.id == item.id
//       } {
//           
//       }
        
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompilation()
        }
    }
    
    func saveItems() {
        if let encodedata = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedata, forKey: itemsKey)
        }
    }
}
