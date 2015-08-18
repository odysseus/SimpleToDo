//
//  ToDoList.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/15/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

class ToDoList: NSObject, NSCoding {
    var name: String
    var items: [ToDoItem]
    
    init(name: String) {
        self.name = name
        self.items = []
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.items = aDecoder.decodeObjectForKey("items") as! [ToDoItem]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(items, forKey: "items")
    }
    
    func addItem(name: String) {
        let item = ToDoItem(name: name)
        self.items.append(item)
    }
    
    func itemAtIndex(index: Int) -> ToDoItem {
        return self.items[index]
    }
    
    func removeAtIndex(index: Int) {
        self.items.removeAtIndex(index)
    }
    
    func removeItem(item: ToDoItem) {
        for var i=0; i < self.items.count; i++ {
            if self.items[i] == item {
                self.items.removeAtIndex(i)
            }
        }
    }
    
    func count() -> Int {
        return self.items.count
    }
    
    func changeName(name: String) {
        self.name = name
    }
    
    func totalCompleted() -> Int {
        var total = 0
        for item in self.items {
            if item.completed {
                total++
            }
        }
        return total
    }
    
    func totalIncomplete() -> Int {
        return self.count() - self.totalCompleted()
    }
}










