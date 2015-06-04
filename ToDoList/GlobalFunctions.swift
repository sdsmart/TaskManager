//
//  GlobalFunctions.swift
//  ToDoList
//
//  Created by Steve Smart on 6/2/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation

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