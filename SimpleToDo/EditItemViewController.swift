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
        
        let flatNephritis = UIColor(red: CGFloat(39.0/255.0), green: CGFloat(174.0/255.0), blue: CGFloat(96.0/255.0), alpha: CGFloat(1.0))
        self.markCompleteButton.setTitleColor(flatNephritis, forState: .Normal)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.nameTextField.placeholder = self.item!.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
