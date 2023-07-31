//
//  ContentView.swift
//  ToDoList
//
//  Created by Amir Saulebekov on 7/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.list.isEmpty{
                EmptyView()
            }
            else{
                List{
                    ForEach(listViewModel.list){item in
                        HView(item: item)
                            .onTapGesture {
                                    listViewModel.updateItem(item: item)
                            }
                    }
                    .onDelete(perform: listViewModel.itemDelete)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("To-Do List")
            
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    EditButton()
                }
                ToolbarItem(placement: .confirmationAction){
                    NavigationLink("Add", destination: AddView())
                }

            }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
        .environmentObject(ListViewModel())

    }
}

