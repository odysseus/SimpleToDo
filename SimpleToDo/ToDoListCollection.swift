//
//  ToDoListCollection.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/20/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

class ToDoListCollection: NSObject, NSCoding {
    
    var lists: [ToDoList]
    
    override init() {
        lists = []
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        lists = aDecoder.decodeObjectForKey("lists") as! [ToDoList]
    }
    
    subscript(index: Int) -> ToDoList {
        return lists[index]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(lists, forKey: "lists")
    }
    
    func count() -> Int {
        return lists.count
    }
    
    func addList(list: ToDoList) {
        lists.append(list)
    }
    
    func addList(list: ToDoList, withName name: String) {
        lists.append(ToDoList(listName: name))
    }
    
    func lastIndex() -> Int {
        return lists.count - 1
    }
    
    func newList() {
        addList(ToDoList())
    }
    
    func removeAtIndex(index: Int) {
        lists.removeAtIndex(index)
    }
   
}
