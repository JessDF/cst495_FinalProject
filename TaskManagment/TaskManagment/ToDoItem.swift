//
//  ToDoItem.swift
//  TaskManagment
//
//  Created by Jessie Dowding on 9/27/17.
//  Copyright © 2017 cst495_TaskManagement. All rights reserved.
//

import Foundation

class ToDoItem {
    var title: String
    var done: Bool
    
    public init(title: String) {
        self.title = title
        self.done = false
    }
}

extension ToDoItem {
    public class func getMockData() -> [ToDoItem] {
        return [
            ToDoItem(title: "Milk"),
            ToDoItem(title: "Chocolate"),
            ToDoItem(title: "Light bulb"),
            ToDoItem(title: "Dog food")
        ]
    }
}
