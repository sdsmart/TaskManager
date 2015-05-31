//
//  OptionsViewControllerDelegate.swift
//  ToDoList
//
//  Created by Steve Smart on 5/30/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation

protocol OptionsDelegate {
    func didSetSortOrder(sender: OptionsViewController, sortOrder: String)
}