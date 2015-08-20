//
//  AddItemViewController.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/16/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.itemNameField.delegate = self
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
        
        self.performSegueWithIdentifier("unwindFromAddItem", sender: self)
        
        return true
    }

}
