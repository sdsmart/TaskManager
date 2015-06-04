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
    var optionsButtonOnToDoListTableViewControllerColor: UIColor { get }
    var newButtonOnToDoListTableViewControllerColor: UIColor { get }
    
    // Options View Colors
    var sortByLabelOnOptionsViewControllerColor: UIColor { get }
    var colorSchemeLabelOnOptionsViewControllerColor: UIColor { get }
    var dismissButtonOnOptionsViewControllerColor: UIColor { get }
    
    // Details And Editor View Shared Colors
    var nameLabelOnDetailsAndEditorViewControllerColor: UIColor { get }
    var importanceLabelOnDetailsAndEditorViewControllerColor: UIColor { get }
    var dueDateLabelOnDetailsAndEditorViewControllerColor: UIColor { get }
    var dueDateValueLabelOnDetailsAndEditorViewControllerColor: UIColor { get }
    var detailsLabelOnDetailsAndEditorViewControllerColor: UIColor { get }
    
    
    // Details View Only Colors
    var backButtonOnDetailsViewControllerColor: UIColor { get }
    var createdDateLabelOnDetailsViewControllerColor: UIColor { get }
    var editButtonOnDetailsViewControllerColor: UIColor { get }
    
    // Editor View Only Colors
    var cancelButtonOnEditorViewControllerColor: UIColor { get }
    var saveButtonOnEditorViewControllerColor: UIColor { get }
    var changeButtonOnEditorViewControllerColor: UIColor { get }
    
    // DueDatePicker View Colors
    var saveButtonOnDatePickerViewControllerColor: UIColor { get }
}