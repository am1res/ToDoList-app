//
//  contentViewModel.swift
//  ToDoList
//
//  Created by Amir Saulebekov on 7/22/23.
//

import Foundation


class ListViewModel: ObservableObject{
    @Published var list:[ItemMode] = []{
        didSet{
            saveItems()
        }
    }
    let itemKey:String = "items_list"
    init(){
        appendItems()
    }
    
    func appendItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemMode].self, from: data)
        else{return}
        
        self.list = savedItems
    }
    
    func itemDelete(indexSet:IndexSet){
        list.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to:Int){
        list.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        let newItem = ItemMode(name: title, isCompleted: false)
        list.append(newItem)
    }
    
    func updateItem(item: ItemMode){
        if let index = list.firstIndex(where: { $0.id == item.id}){
            list[index] = item.updateComletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(list){
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
