//
//  MyTodoListApp.swift
//  MyTodoList
//
//  Created by Zohidjon on 20/02/26.
//

internal import SwiftUI

@main
struct MyTodoListApp: App {
   @StateObject var listVieModel:ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listVieModel)
        }
    }
}
