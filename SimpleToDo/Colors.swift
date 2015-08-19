//
//  RCColors.swift
//  SimpleToDo
//
//  Created by Ryan Case on 8/17/15.
//  Copyright (c) 2015 Ryan Case. All rights reserved.
//

import UIKit

extension UIColor {
    class func rgba(r: Int, g: Int, b: Int, a: Float) -> UIColor {
        let floatRed = CGFloat(r) / 255.0
        let floatGreen = CGFloat(g) / 255.0
        let floatBlue = CGFloat(b) / 255.0
        return UIColor(red: floatRed, green: floatGreen, blue: floatBlue, alpha: CGFloat(a))
    }
    
    class func flatNephritis() -> UIColor {
        return UIColor.rgba(39, g: 174, b: 96, a: 1.0)
    }
    
    class func flatPumpkin() -> UIColor {
        return UIColor.rgba(211, g: 84, b: 0, a: 1.0)
    }
}