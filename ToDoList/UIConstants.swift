//
//  UIConstants.swift
//  ToDoList
//
//  Created by Steve Smart on 5/28/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation
import UIKit

public struct UIConstants {
    
    public struct Appearance {
        static let taskEditorTitleForAdd = "Add Task"
        static let taskEditorTitleForEdit = "Edit Task"
        static let textViewBorderRadius: CGFloat = 4.0
        static let textViewBorderWidth: CGFloat = 0.5
        static let optionsViewControllerSize = CGSize(width: 295.0, height: 180.0)
    }
    
    public struct Animation {
        static let keyboardSlideAnimationDistanceOffset: CGFloat = 75
        static let keyboardSlideViewAnimationUpDuration = 0.28
        static let keyboardSlideViewAnimationDownDuration = 0.18
    }
    
    public struct Colors {
        static let highImportanceColor = UIColor.colorFromRGB(r: 190, g: 0, b: 0)
        static let mediumImportanceColor = UIColor.colorFromRGB(r: 220, g: 80, b: 0)
        static let lowImportanceColor = UIColor.colorFromRGB(r: 0, g: 160, b: 0)
        
        public struct ColorScheme {
            static let defaultScheme = "DefaultColorScheme"
            static let blueScheme = "BlueColorScheme"
            static let redScheme = "RedColorScheme"
        }
        
        public struct DefaultColorScheme: ColorSchemeProtocol {
            // Main Colors
            public var mainBackgroundColor = UIColor.colorFromRGB(r: 255, g: 246, b: 150)
            public var secondaryBackgroundColor = UIColor.colorFromRGB(r: 255, g: 246, b: 200)
            
            // Cell Colors
            public var cellBackgroundColor = UIColor.colorFromRGB(r: 255, g: 246, b: 100)
            public var subtitleDueDateOnCellColor = UIColor.colorFromRGB(r: 0, g: 15, b: 195)
            
            // ToDoList TableView Colors
            public var optionsButtonOnToDoListTableViewControllerColor = UIColor.colorFromRGB(r: 94, g: 10, b: 0)
            public var newButtonOnToDoListTableViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 230)
            
            // Options View Colors
            public var sortByLabelOnOptionsViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 255)
            public var colorSchemeLabelOnOptionsViewControllerColor = UIColor.colorFromRGB(r: 0, g: 100, b: 0)
            public var dismissButtonOnOptionsViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
            
            // Details and Editor View Shared Colors
            public var nameLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 230)
            public var importanceLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
            public var dueDateLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 230)
            public var dueDateValueLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 185, g: 0, b: 0)
            public var detailsLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
            
            // Details View Only Colors
            public var backButtonOnDetailsViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 230)
            public var createdDateLabelOnDetailsViewControllerColor = UIColor.colorFromRGB(r: 45, g: 50, b: 75)
            public var editButtonOnDetailsViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 230)
            
            // Editor View Only Colors
            public var cancelButtonOnEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 230)
            public var saveButtonOnEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 230)
            public var changeButtonOnEditorViewControllerColor = UIColor.colorFromRGB(r: 100, g: 100, b: 255)
            
            
            // DueDatePicker View Colors
            public var saveButtonOnDatePickerViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
        }
        
        public struct BlueColorScheme: ColorSchemeProtocol {
            // Main Colors
            public var mainBackgroundColor = UIColor.colorFromRGB(r: 200, g: 230, b: 255)
            public var secondaryBackgroundColor = UIColor.colorFromRGB(r: 225, g: 250, b: 255)
            
            // Cell Colors
            public var cellBackgroundColor = UIColor.colorFromRGB(r: 140, g: 220, b: 250)
            public var subtitleDueDateOnCellColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
            
            // ToDoList TableView Colors
            public var optionsButtonOnToDoListTableViewControllerColor = UIColor.colorFromRGB(r: 190, g: 135, b: 5)
            public var newButtonOnToDoListTableViewControllerColor = UIColor.colorFromRGB(r: 170, g: 5, b: 0)
            
            // Options View Colors
            public var sortByLabelOnOptionsViewControllerColor = UIColor.colorFromRGB(r: 160, g: 0, b: 0)
            public var colorSchemeLabelOnOptionsViewControllerColor = UIColor.colorFromRGB(r: 0, g: 160, b: 0)
            public var dismissButtonOnOptionsViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
            
            // Details and Editor View Shared Colors
            public var nameLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 94, g: 10, b: 0)
            public var importanceLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 64, g: 34, b: 115)
            public var dueDateLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 94, g: 10, b: 0)
            public var dueDateValueLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 230)
            public var detailsLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
            
            // Details View Only Colors
            public var createdDateLabelOnDetailsViewControllerColor = UIColor.colorFromRGB(r: 135, g: 94, b: 20)
            public var backButtonOnDetailsViewControllerColor = UIColor.colorFromRGB(r: 170, g: 5, b: 0)
            public var editButtonOnDetailsViewControllerColor = UIColor.colorFromRGB(r: 170, g: 5, b: 0)
            
            // Editor View Only Colors
            public var cancelButtonOnEditorViewControllerColor = UIColor.colorFromRGB(r: 170, g: 5, b: 0)
            public var saveButtonOnEditorViewControllerColor = UIColor.colorFromRGB(r: 170, g: 5, b: 0)
            public var changeButtonOnEditorViewControllerColor = UIColor.colorFromRGB(r: 135, g: 94, b: 20)
            
            // DueDatePicker View Colors
            public var saveButtonOnDatePickerViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
        }
        
        public struct RedColorScheme: ColorSchemeProtocol {
            // Main Colors
            public var mainBackgroundColor = UIColor.colorFromRGB(r: 255, g: 180, b: 180)
            public var secondaryBackgroundColor = UIColor.colorFromRGB(r: 255, g: 225, b: 225)
            
            // Cell Colors
            public var cellBackgroundColor = UIColor.colorFromRGB(r: 230, g: 160, b: 160)
            public var subtitleDueDateOnCellColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
            
            // ToDoList TableView Colors
            public var optionsButtonOnToDoListTableViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 200)
            public var newButtonOnToDoListTableViewControllerColor = UIColor.colorFromRGB(r: 70, g: 0, b: 94)
            
            // Options View Colors
            public var sortByLabelOnOptionsViewControllerColor = UIColor.colorFromRGB(r: 110, g: 65, b: 0)
            public var colorSchemeLabelOnOptionsViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 200)
            public var dismissButtonOnOptionsViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
            
            // Details and Editor View Shared Colors
            public var nameLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 200)
            public var importanceLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 65, g: 34, b: 115)
            public var dueDateLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 100, b: 0)
            public var dueDateValueLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 230)
            public var detailsLabelOnDetailsAndEditorViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
            
            // Details View Only Colors
            public var createdDateLabelOnDetailsViewControllerColor = UIColor.colorFromRGB(r: 10, g: 50, b: 15)
            public var backButtonOnDetailsViewControllerColor = UIColor.colorFromRGB(r: 70, g: 0, b: 92)
            public var editButtonOnDetailsViewControllerColor = UIColor.colorFromRGB(r: 70, g: 0, b: 92)
            
            // Editor View Only Colors
            public var cancelButtonOnEditorViewControllerColor = UIColor.colorFromRGB(r: 70, g: 0, b: 92)
            public var saveButtonOnEditorViewControllerColor = UIColor.colorFromRGB(r: 70, g: 0, b: 92)
            public var changeButtonOnEditorViewControllerColor = UIColor.colorFromRGB(r: 100, g: 0, b: 0)
            
            // DueDatePicker View Colors
            public var saveButtonOnDatePickerViewControllerColor = UIColor.colorFromRGB(r: 0, g: 0, b: 150)
        }
    }
}

extension UIColor {
    class func colorFromRGB(#r: Int, g: Int, b: Int) -> UIColor {
        return UIColor(red: CGFloat(r) / CGFloat(255.0),
        green: CGFloat(g) / CGFloat(255.0),
        blue: CGFloat(b) / CGFloat(255.0),
        alpha: 1.0)
    }
}
