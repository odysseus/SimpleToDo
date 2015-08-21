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
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(lists, forKey: "lists")
    }
    
    func count() -> Int {
        return lists.count
    }
    
    func listAtIndex(index: Int) -> ToDoList {
        return lists[index]
    }
    
    func addList(list: ToDoList) {
        lists.append(list)
    }
    
    func addList(list: ToDoList, withName name: String) {
        lists.append(ToDoList(listName: name))
    }
    
    func addEmptyList() {
        addList(ToDoList())
    }
   
}
