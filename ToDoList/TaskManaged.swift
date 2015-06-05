//
//  ToDoItemManagedModel.swift
//  ToDoList
//
//  Created by Steve Smart on 5/26/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation
import CoreData

class TaskManaged: NSManagedObject {
    
    // MARK: Properties
    @NSManaged var uuid: String
    @NSManaged var name: String
    @NSManaged var details: String
    @NSManaged var importance: Int
    @NSManaged var createdDate: NSDate
    @NSManaged var dueDate: NSDate
}