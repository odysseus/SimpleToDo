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
        
        pageViewController = UIPageViewController()
        pageViewController?.delegate = self
        pageViewController?.dataSource = self
        
        let initialVC = viewControllerAtIndex(0)
        self.pageViewController?.setViewControllers([initialVC], direction: .Forward, animated: false, completion: nil)
        
        self.addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        self.pageViewController?.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> ToDoListViewController {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ToDoListViewController") as! ToDoListViewController
        vc.index = index
        vc.toDoList = toDoLists.listAtIndex(index)
        
        return vc
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ToDoListViewController
        let index = vc.index!
        
        if index == 0 || index == NSNotFound {
            return nil
        } else {
            let currentVC = viewController as! ToDoListViewController
            let nextVC = viewControllerAtIndex(index - 1)
            nextVC.showCompleted = currentVC.showCompleted
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
            nextVC.showCompleted = currentVC.showCompleted
            return nextVC
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return toDoLists.count()
    }

}
