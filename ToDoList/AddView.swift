//
//  AddView.swift
//  ToDoList
//
//  Created by Amir Saulebekov on 7/22/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var text:String = ""
    
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Enter here", text: $text)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                Button("Save"){
                    appendNewOne()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text(alertTitle), message: Text("try again"))
                    
                })
                
                Spacer()

            }
            .padding(20)
            .navigationTitle("Add duty")
        }
    }
    func appendNewOne(){
        if isApplicable(){
            listViewModel.addItem(title: text)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func isApplicable() -> Bool{
        if text.count < 3{
            showAlert = true
            return false
        }
        return true
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddView()
        }
        .environmentObject(ListViewModel())
}
}
