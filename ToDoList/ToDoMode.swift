//
//  ToDoMode.swift
//  ToDoList
//
//  Created by Amir Saulebekov on 7/22/23.
//

import Foundation

struct ItemMode: Identifiable, Codable{
    let id:String
    let name:String
    let isCompleted:Bool
    
    init(id: String = UUID().uuidString, name: String, isCompleted: Bool) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
    
    func updateComletion() -> ItemMode{
        return ItemMode(id: id, name: name, isCompleted: !isCompleted)
    }
}


