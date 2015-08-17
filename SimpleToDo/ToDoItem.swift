//
//  ToDoItem.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/15/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

class ToDoItem: NSObject, NSCoding {
    
    var name: String
    var completed: Bool
    var createdAt: NSDate
    var completedAt: NSDate?
    
    init(name: String) {
        self.name = name
        self.completed = false
        self.createdAt = NSDate()
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.completed = aDecoder.decodeObjectForKey("completed") as! Bool
        self.createdAt = aDecoder.decodeObjectForKey("createdAt") as! NSDate
        self.completedAt = aDecoder.decodeObjectForKey("completedAt") as! NSDate?
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(completed, forKey: "completed")
        aCoder.encodeObject(createdAt, forKey: "createdAt")
        aCoder.encodeObject(completedAt, forKey: "completedAt")
    }
    
    func markFinished() {
        self.completedAt = NSDate()
        self.completed = true
    }
    
    func markUnfinished() {
        self.completedAt = nil
        self.completed = false
    }
   
}
