//
//  DueDatePickerDelegate.swift
//  ToDoList
//
//  Created by Steve Smart on 6/1/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation

protocol DatePickerDelegate {
    func didSelectDate(sender: DatePickerViewController, selectedDate: NSDate)
}
