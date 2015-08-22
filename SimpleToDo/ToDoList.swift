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
    var showCompleted: Bool
    var items: [ToDoItem]
    
    override init() {
        name = "To Do"
        items = []
        showCompleted = true
        super.init()
    }
    
    convenience init(listName: String) {
        self.init()
        name = listName
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        showCompleted = aDecoder.decodeObjectForKey("showCompleted") as! Bool
        items = aDecoder.decodeObjectForKey("items") as! [ToDoItem]
    }
    
    subscript (index: Int) -> ToDoItem {
        return items[index]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(showCompleted, forKey: "showCompleted")
        aCoder.encodeObject(items, forKey: "items")
    }
    
    func addItem(byName name: String) {
        let item = ToDoItem(name: name)
        items.append(item)
    }
    
    func addItem(item: ToDoItem) {
        items.append(item)
    }
    
    func itemAtIndex(index: Int) -> ToDoItem {
        return items[index]
    }
    
    func removeAtIndex(index: Int) {
        items.removeAtIndex(index)
    }
    
    func removeItem(item: ToDoItem) {
        for var i=0; i < items.count; i++ {
            if items[i] == item {
                items.removeAtIndex(i)
            }
        }
    }
    
    func count() -> Int {
        return items.count
    }
    
    func changeName(name: String) {
        self.name = name
    }
    
    func totalCompleted() -> Int {
        var total = 0
        for item in items {
            if item.completed {
                total++
            }
        }
        return total
    }
    
    func totalIncomplete() -> Int {
        var total = 0
        for item in items {
            if !item.completed {
                total++
            }
        }
        return total
    }
    
    func incompleteItems() -> [ToDoItem] {
        var incomplete: [ToDoItem] = []
        for item in items {
            if !item.completed {
                incomplete.append(item)
            }
        }
        return incomplete
    }
    
    func removeCompleted() {
        items = self.incompleteItems()
    }
}










