//
//  GlobalFunctions.swift
//  ToDoList
//
//  Created by Steve Smart on 6/2/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation
import UIKit

public func getStringFromDate(date: NSDate) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
    dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
    let dueDateText = dateFormatter.stringFromDate(date)
    let stringLength = count(dueDateText)
    var ierror: NSError?
    var regex: NSRegularExpression = NSRegularExpression(pattern: ",\\s\\d+",
        options: NSRegularExpressionOptions.CaseInsensitive,
        error: &ierror)!
    var dueDateTextWithoutYear = regex.stringByReplacingMatchesInString(dueDateText,
        options: nil, range: NSMakeRange(0, stringLength), withTemplate: "")
    return dueDateTextWithoutYear
}

public func UIColorFromRGB(#r: Int, #g: Int, #b: Int) -> UIColor {
    return UIColor(red: CGFloat(r) / CGFloat(255.0),
                   green: CGFloat(g) / CGFloat(255.0),
                   blue: CGFloat(b) / CGFloat(255.0),
                   alpha: 1.0)
}