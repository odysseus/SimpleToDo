//
//  ViewController.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/15/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var toDoList = ToDoList(name: "To Do")
    @IBOutlet weak var listNameButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as? NSData {
            self.toDoList = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! ToDoList
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.listNameButton.setTitle(self.toDoList.name, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell") as! UITableViewCell
        let index = indexPath.row
        
        cell.textLabel?.text = toDoList.itemNameForIndex(index)
        
        return cell
    }
    
    @IBAction func unwindFromChangeName(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! ChangeListNameViewController
        let name = source.nameField.text
        if name != "" {
            self.toDoList.name = name
            self.listNameButton.setTitle(name, forState: UIControlState.Normal)
        }
    }
    
    @IBAction func unwindFromAddItem(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! AddItemViewController
        let name = source.itemNameField.text
        if name != "" {
            self.toDoList.addItem(name)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func unwindFromCancel(segue: UIStoryboardSegue) {
        return
    }
    
    func saveData() {
        println("Archiving state")
        let encodedList: NSData = NSKeyedArchiver.archivedDataWithRootObject(self.toDoList)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(encodedList, forKey: "toDoList")
        defaults.synchronize()
    }

}

