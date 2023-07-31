//
//  HView.swift
//  ToDoList
//
//  Created by Amir Saulebekov on 7/22/23.
//

import SwiftUI

struct HView: View {
    let item:ItemMode
    @State var title:String = ""
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green:.red)
            Text(item.name)
                .font(.headline)
        }
    }
    
}

struct HView_Previews: PreviewProvider {
    
    static var item1 = ItemMode(name: "first task", isCompleted: false)
    
    static var item2 = ItemMode(name: "second task", isCompleted: true)
    
    static var previews: some View {
        Group{
            HView(item: item1)
            HView(item: item2)
        }
        .previewLayout(.sizeThatFits)

    }
}


