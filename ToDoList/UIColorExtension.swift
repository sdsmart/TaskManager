//
//  Extensions.swift
//  ToDoList
//
//  Created by Steve Smart on 6/4/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func colorFromRGB(#r: Int, g: Int, b: Int) -> UIColor {
        return UIColor(red: CGFloat(r) / CGFloat(255.0),
            green: CGFloat(g) / CGFloat(255.0),
            blue: CGFloat(b) / CGFloat(255.0),
            alpha: 1.0)
    }
}