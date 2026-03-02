//
//  ListRowView.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import SwiftUI

struct ListRowView: View {
    let tite:String
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(tite)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(tite:"This is the first item!")
}
