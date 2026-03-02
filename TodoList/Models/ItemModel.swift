//
//  ItemModel.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import Foundation

struct ItemModel:Identifiable,Codable {
    let id:String
    let title:String
    let isCompleted: Bool
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompilation() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
