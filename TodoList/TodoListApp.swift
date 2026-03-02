//
//  TodoListApp.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - Data point
 View - UI
 ViewModel - manage model for View
 
 */

@main
struct TodoListApp: App {
    
   @State var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel )
        }
    }
}
