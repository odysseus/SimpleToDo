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
    var selectedItem: ToDoItem?
    
    @IBOutlet weak var listNameButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showCompletedSwitch: UISwitch!

    // View Delegate Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    // Table View Functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell") as! UITableViewCell
        let index = indexPath.row
        let item = toDoList.itemAtIndex(index)
        
        cell.textLabel?.text = item.name
        if item.completed {
            cell.textLabel?.textColor = UIColor.flatNephritis()
        } else {
            cell.textLabel?.textColor = UIColor.blackColor()
        }
        
        return cell
    }
    
    // Segue and Storyboard functions
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let segueName = segue.identifier
        
        if segueName == "changeListNameSegue" {
            changeListNameSegue(segue)
        } else if segueName == "editItemSegue" {
            editItemSegue(segue)
        }
    }
    
    func changeListNameSegue(segue: UIStoryboardSegue) {
        let destination = segue.destinationViewController as! ChangeListNameViewController
        destination.toDoList = self.toDoList
    }
    
    func editItemSegue(segue: UIStoryboardSegue) {
        // Get the indexPath and index
        let indexPath = tableView.indexPathForSelectedRow()!
        let index = indexPath.row
        
        // Find the selected item, get the destination VC and set the item in it
        self.selectedItem = self.toDoList.itemAtIndex(index)
        let destination = segue.destinationViewController as! EditItemViewController
        destination.item = self.selectedItem
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // Unwind Actions
    
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
    
    @IBAction func unwindFromToggleCompletion(segue: UIStoryboardSegue) {
        if self.selectedItem!.completed {
            self.selectedItem!.completed = false
            self.selectedItem?.completedAt = nil
        } else {
            self.selectedItem!.completed = true
            self.selectedItem!.completedAt = NSDate()
        }
        
        self.tableView.reloadData()
        self.selectedItem = nil
    }
    
    @IBAction func unwindFromChangeItemName(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! EditItemViewController
        let newName = source.nameTextField.text
        
        if newName != "" {
            self.selectedItem!.name = newName
        }
        self.tableView.reloadData()
        self.selectedItem = nil
    }
    
    @IBAction func unwindFromDeleteItem(segue: UIStoryboardSegue) {
        self.toDoList.removeItem(self.selectedItem!)
        
        self.tableView.reloadData()
        self.selectedItem = nil
    }
    
    // NSUserDefaults and Saving State
    
    func saveData() {
        println("Archiving state")
        let encodedList: NSData = NSKeyedArchiver.archivedDataWithRootObject(self.toDoList)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(encodedList, forKey: "toDoList")
        defaults.synchronize()
    }

}


















