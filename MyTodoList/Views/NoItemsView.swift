//
//  NoItemsView.swift
//  MyTodoList
//
//  Created by Zohidjon on 20/02/26.
//

internal import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let SecondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
       ScrollView {
           VStack(spacing: 10) {
               Text("No items yet!")
                   .font(.title)
                   .fontWeight(.semibold)
                   .foregroundColor(.primary)
               Text("Add a new item to get started. 🎉 and enjoy adding new things to your list.")
                   .padding(.bottom, 20)
                   .font(.subheadline)
                   .foregroundColor(.secondary)
               NavigationLink(destination: AddView()) {
                   Text("Add something 🥳")
                       .foregroundColor(.white)
                       .font(.headline)
                       .frame(height: 60)
                       .frame(maxWidth: .infinity)
                       .background(animate ? SecondaryAccentColor.opacity(0.6) : Color.accentColor)
                       .cornerRadius(10)
                       .padding(.horizontal, animate ? 20 : 0)
                       .shadow(radius: animate ? 80 : 30, x: 0, y: animate ? 40 : 50 )
                   
                       
               }
               .offset(y: animate ? -7.5 : 0 )
           }
           .multilineTextAlignment(.center)
           .padding(40)
           .onAppear (perform: animateMe)
        }
       .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func animateMe() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle(Text("Title."))
    }
}
