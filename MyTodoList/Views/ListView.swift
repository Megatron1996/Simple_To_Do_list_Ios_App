//
//  ListView.swift
//  MyTodoList
//
//  Created by Zohidjon on 20/02/26.
//

internal import SwiftUI
struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach (listViewModel.items) { item in
                        listRowView(item: item)
                            .onTapGesture {apGesture in
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        
        .navigationTitle(Text("Todo List 📋"))
        .navigationBarItems(
leading: EditButton(),
                            trailing:
    NavigationLink(
        "Add Item",
        destination: AddView()))
        
       
    }
  
    }

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
