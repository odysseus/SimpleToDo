//
//  EditListViewController.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/16/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

class EditListViewController: UIViewController, UITextFieldDelegate {
    
    var toDoList: ToDoList?
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet weak var removeCompletedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        self.removeCompletedButton.setTitleColor(UIColor.flatPumpkin(), forState: .Normal)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.nameField.placeholder = self.toDoList!.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        self.performSegueWithIdentifier("unwindFromChangeListName", sender: self)
        
        return true
    }

}
