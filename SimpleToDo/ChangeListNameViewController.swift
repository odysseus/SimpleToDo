//
//  ChangeListNameViewController.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/16/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

class ChangeListNameViewController: UIViewController {
    
    var toDoList: ToDoList?
    
    @IBOutlet var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.nameField.placeholder = self.toDoList!.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
