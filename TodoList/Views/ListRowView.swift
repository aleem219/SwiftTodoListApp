//
//  ListRowView.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import SwiftUI

struct ListRowView: View {
    let item:ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        let item1 = ItemModel(title: "First item!", isCompleted: false)
        let item2 = ItemModel(title: "Second item!", isCompleted: true)

        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
