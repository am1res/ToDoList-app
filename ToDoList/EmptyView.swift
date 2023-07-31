//
//  EmptyView.swift
//  ToDoList
//
//  Created by Amir Saulebekov on 7/24/23.
//

import SwiftUI

struct EmptyView: View {
    @State var animate:Bool = false
    var body: some View {
        ScrollView{
            Group{
                Text("You dont have anything in the To-Do list yet!")
                Text("Shall we start adding tasks for todays productive day?")
                    .multilineTextAlignment(.center)
            }
            .font(.headline)
            
            NavigationLink(destination: AddView()) {
                Text("Add Tasks")
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(animate ? Color.red:Color.accentColor)
            .cornerRadius(20)
            .padding(20)

            Spacer()
        }
        .onAppear(perform: addAnimation)
    }
    func addAnimation(){
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 1.5)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            EmptyView()
                .navigationTitle("title")
        }
        
    }
}
