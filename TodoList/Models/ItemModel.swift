//
//  ItemModel.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import Foundation

struct ItemModel:Identifiable {
    let id:String = UUID().uuidString
    let title:String
    let isCompleted: Bool
}
