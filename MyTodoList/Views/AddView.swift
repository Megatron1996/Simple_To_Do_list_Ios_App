//
//  AddView.swift
//  MyTodoList
//
//  Created by Zohidjon on 20/02/26.
//

internal import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("New Task here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button(action:saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
            }
            .padding(16)
        }
        .navigationTitle(Text("Add Task 🖋️"))
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    func saveButtonPressed() {
        if textIsAppropriateLength(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriateLength() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your task shoul be minimum length of 3 characters.👋"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
