//
//  ListRowView.swift
//  MyTodoList
//
//  Created by Zohidjon on 20/02/26.
//

internal import SwiftUI

struct listRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct listRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "This is the first titel", isCompleted: false)
    static var item2 = ItemModel(title: "This is the second titel", isCompleted: true)
    static var previews: some View {
        Group{
            listRowView(item: item1)
            listRowView(item: item2)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}

