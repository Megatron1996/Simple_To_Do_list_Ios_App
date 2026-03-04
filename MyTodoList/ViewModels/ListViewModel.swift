//
//  ListViewModel.swift
//  MyTodoList
//
//  Created by Zohidjon on 20/02/26.
//

import Foundation
internal import Combine
internal import SwiftUI

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init () {
        getItems()
    }
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the first item", isCompleted: true),
//            ItemModel(title: "This is the second item", isCompleted: true),
//            ItemModel(title: "This is the third item", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        guard
               let data = UserDefaults.standard.data(forKey: itemsKey),
               let _ = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel) {
        
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    func saveItems() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: itemsKey)
        }
    }
}

