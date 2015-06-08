//
//  NSDateFormatterExtension.swift
//  ToDoList
//
//  Created by Steve Smart on 6/4/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation

extension NSDateFormatter {
    class func getStringFromDateWithoutYear(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let dueDateText = dateFormatter.stringFromDate(date)
        let originalStringLength = count(dueDateText)
        
        var ierror: NSError?
        var regex: NSRegularExpression = NSRegularExpression(pattern: ",\\s\\d+",
            options: NSRegularExpressionOptions.CaseInsensitive,
            error: &ierror)!
        let dueDateTextWithoutYear = regex.stringByReplacingMatchesInString(dueDateText,
            options: nil, range: NSMakeRange(0, originalStringLength), withTemplate: "")
        
        let modifiedStringLength = count(dueDateTextWithoutYear)
        var finalResult = dueDateTextWithoutYear
        
        if NSCalendar.currentCalendar().isDateInToday(date) {
            regex = NSRegularExpression(pattern: "\\w{3,}\\s\\d+",
                options: NSRegularExpressionOptions.CaseInsensitive,
                error: &ierror)!
            finalResult = regex.stringByReplacingMatchesInString(dueDateTextWithoutYear,
                options: nil, range: NSMakeRange(0, modifiedStringLength), withTemplate: "Today")
        } else if NSCalendar.currentCalendar().isDateInTomorrow(date) {
            regex = NSRegularExpression(pattern: "\\w{3,}\\s\\d+",
                options: NSRegularExpressionOptions.CaseInsensitive,
                error: &ierror)!
            finalResult = regex.stringByReplacingMatchesInString(dueDateTextWithoutYear,
                options: nil, range: NSMakeRange(0, modifiedStringLength), withTemplate: "Tomorrow")
        }
        
        return finalResult
    }
}