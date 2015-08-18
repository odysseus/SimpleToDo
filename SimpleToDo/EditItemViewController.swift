//
//  EditItemViewController.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/17/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {
    
    var item: ToDoItem?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var markCompleteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.nameTextField.placeholder = self.item!.name
        if self.item!.completed {
            self.markCompleteButton.setTitle("Mark Incomplete", forState: .Normal)
            self.markCompleteButton.setTitleColor(UIColor.flatPumpkin(), forState: .Normal)
        } else {
            self.markCompleteButton.setTitle("Mark Complete", forState: .Normal)
            self.markCompleteButton.setTitleColor(UIColor.flatNephritis(), forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
