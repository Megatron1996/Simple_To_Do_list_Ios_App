//
//  ItemModel.swift
//  MyTodoList
//
//  Created by Zohidjon on 20/02/26.
//

internal import SwiftUI

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion()-> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
