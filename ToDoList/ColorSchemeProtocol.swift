//
//  ColorSchemeProtocol.swift
//  ToDoList
//
//  Created by Steve Smart on 5/31/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation
import UIKit

public protocol ColorSchemeProtocol {
    var mainBackgroundColor: UIColor { get }
    var secondaryBackgroundColor: UIColor { get }
    
    // Cell Colors
    var cellBackgroundColor: UIColor { get }
    var subtitleDueDateOnCellColor: UIColor { get }
    
    // ToDoList TableView Colors
    var optionsButtonColor: UIColor { get }
    var newButtonColor: UIColor { get }
    
    // Options View Colors
    var sortByLabelColor: UIColor { get }
    var colorSchemeLabelColor: UIColor { get }
    var dismissButtonColor: UIColor { get }
    
    // Details / Editor View Colors
    var nameLabelColor: UIColor { get }
    var importanceLabelColor: UIColor { get }
    var createdDateLabelColor: UIColor { get }
    var dueDateLabelColor: UIColor { get }
    var dueDateTextColor: UIColor { get }
    var detailsLabelColor: UIColor { get }
    var backButtonColor: UIColor { get }
    var editButtonColor: UIColor { get }
    var cancelButtonColor: UIColor { get }
    var saveButtonColor: UIColor { get }
}