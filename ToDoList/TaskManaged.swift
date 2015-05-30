//
//  ToDoItemManagedModel.swift
//  ToDoList
//
//  Created by Steve Smart on 5/26/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation
import CoreData

public class TaskManaged: NSManagedObject {
    
    // MARK: - Properties
    @NSManaged public var name: String
    @NSManaged public var details: String
    @NSManaged public var importance: Int
}