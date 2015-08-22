//
//  RootViewController.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/20/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var toDoLists = ToDoListCollection()
    var pageViewController: UIPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lists = NSUserDefaults.standardUserDefaults().objectForKey("toDoLists") as? NSData {
            toDoLists = NSKeyedUnarchiver.unarchiveObjectWithData(lists) as! ToDoListCollection
        }
        
        pageViewController = UIPageViewController()
        pageViewController!.delegate = self
        pageViewController!.dataSource = self
        
        let initialVC = viewControllerAtIndex(0)
        self.pageViewController?.setViewControllers([initialVC], direction: .Forward, animated: false, completion: nil)
        
        self.addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        self.pageViewController!.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Getting and Destroying View Controllers
    
    func viewControllerAtIndex(index: Int) -> ToDoListViewController {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ToDoListViewController") as! ToDoListViewController
        vc.manager = self
        vc.index = index
        vc.toDoList = toDoLists[index]
        
        return vc
    }
    
    func createAndDisplayNewList() {
        toDoLists.newList()
        let index = toDoLists.lastIndex()
        
        let newListVC = viewControllerAtIndex(index)
        pageViewController?.setViewControllers([newListVC], direction: .Forward, animated: true, completion: nil)
    }
    
    func removeToDoListAtIndex(index: Int) {
        toDoLists.removeAtIndex(index)
        
        var nextVC: ToDoListViewController
        if index == 0 {
            nextVC = viewControllerAtIndex(0)
        } else {
            nextVC = viewControllerAtIndex(index - 1)
        }
        
        self.pageViewController!.setViewControllers([nextVC], direction: .Reverse, animated: true, completion: nil)
    }
    
    // UIPageView Delegate and Data Source Methods
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ToDoListViewController
        let index = vc.index!
        
        if index == 0 || index == NSNotFound {
            return nil
        } else {
            let currentVC = viewController as! ToDoListViewController
            let nextVC = viewControllerAtIndex(index - 1)
            return nextVC
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ToDoListViewController
        let index = vc.index!
        
        if index == (toDoLists.count() - 1) || index == NSNotFound {
            return nil
        } else {
            let currentVC = viewController as! ToDoListViewController
            let nextVC = viewControllerAtIndex(index + 1)
            return nextVC
        }
    }
    
    // NSUserDefaults Data saving method
    func saveData() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let encodedLists = NSKeyedArchiver.archivedDataWithRootObject(toDoLists)
        
        defaults.setObject(encodedLists, forKey: "toDoLists")
    }
    
    // Populates eight lists with seed data for ease of testing and because Monty Python references are the best seed data
    func seedData() -> ToDoListCollection {
        let titles = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"]
        let e = "egg"
        let b = "bacon"
        let t = "tomato"
        let sa = "sausage"
        let sp = "spam"
        let strings = [
            [e, b],
            [e, sa, b],
            [e, sp],
            [e, b, sp],
            [e, b, sa, sp],
            [sp, b, sa, sp],
            [sp, e, sp, sp, b, sp],
            [sp, sa, sp, sp, b, sp, t, sp]
        ]
        
        let lists = ToDoListCollection()
        
        for var i=0; i < strings.count; i++ {
            let seq = strings[i]
            let title = titles[i]
            
            let newList = ToDoList()
            newList.name = title
            for str in seq {
                newList.addItem(byName: str)
            }
            lists.addList(newList)
        }
        
        return lists
    }

}
