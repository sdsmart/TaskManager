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
        static let highImportanceColor = UIColorFromRGB(r: 190, g: 0, b: 0)
        static let mediumImportanceColor = UIColorFromRGB(r: 220, g: 80, b: 0)
        static let lowImportanceColor = UIColorFromRGB(r: 0, g: 160, b: 0)
        
        public struct ColorScheme {
            static let defaultScheme = "DefaultColorScheme"
            static let blueScheme = "BlueColorScheme"
            static let redScheme = "RedColorScheme"
        }
        
        public struct DefaultColorScheme: ColorSchemeProtocol {
            // Main Colors
            public var mainBackgroundColor = UIColorFromRGB(r: 255, g: 246, b: 150)
            public var secondaryBackgroundColor = UIColorFromRGB(r: 255, g: 246, b: 200)
            
            // Cell Colors
            public var cellBackgroundColor = UIColorFromRGB(r: 255, g: 246, b: 100)
            public var subtitleDueDateOnCellColor = UIColorFromRGB(r: 0, g: 15, b: 195)
            
            // ToDoList TableView Colors
            public var optionsButtonColor = UIColorFromRGB(r: 94, g: 10, b: 0)
            public var newButtonColor = UIColorFromRGB(r: 0, g: 0, b: 230)
            
            // Options View Colors
            public var sortByLabelColor = UIColorFromRGB(r: 0, g: 0, b: 255)
            public var colorSchemeLabelColor = UIColorFromRGB(r: 0, g: 100, b: 0)
            public var dismissButtonColor = UIColorFromRGB(r: 0, g: 0, b: 150)
            
            // Details / Editor View Colors
            public var nameLabelColor = UIColorFromRGB(r: 0, g: 0, b: 230)
            public var importanceLabelColor = UIColorFromRGB(r: 0, g: 0, b: 150)
            public var createdDateLabelColor = UIColorFromRGB(r: 45, g: 50, b: 75)
            public var dueDateLabelColor = UIColorFromRGB(r: 94, g: 10, b: 0)
            public var detailsViewDueDateTextColor = UIColorFromRGB(r: 0, g: 0, b: 230)
            public var detailsLabelColor = UIColorFromRGB(r: 0, g: 0, b: 150)
            public var backButtonColor = UIColorFromRGB(r: 0, g: 0, b: 230)
            public var editButtonColor = UIColorFromRGB(r: 0, g: 0, b: 230)
            public var cancelButtonColor = UIColorFromRGB(r: 0, g: 0, b: 230)
            public var saveButtonColor = UIColorFromRGB(r: 0, g: 0, b: 230)
            public var dueDateHeaderLabelColor = UIColorFromRGB(r: 45, g: 50, b: 75)
            public var editorViewDueDateTextColor = UIColorFromRGB(r: 180, g: 0, b: 0)
            public var changeButtonColor = UIColorFromRGB(r: 100, g: 100, b: 255)
            
            // DueDatePicker View Colors
            public var dueDateSaveButtonColor = UIColorFromRGB(r: 0, g: 0, b: 150)
        }
        
        public struct BlueColorScheme: ColorSchemeProtocol {
            // Main Colors
            public var mainBackgroundColor = UIColor(red: 200/255.0, green: 230/255.0, blue: 255/255.0, alpha: 1.0)
            public var secondaryBackgroundColor = UIColor(red: 225/255.0, green: 250/255.0, blue: 255/255.0, alpha: 1.0)
            
            // Cell Colors
            public var cellBackgroundColor = UIColor(red: 140/255.0, green: 220/255.0, blue: 250/255.0, alpha: 1.0)
            public var subtitleDueDateOnCellColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            
            // ToDoList TableView Colors
            public var optionsButtonColor = UIColor(red: 190/255.0, green: 135/255.0, blue: 5/255.0, alpha: 1.0)
            public var newButtonColor = UIColor(red: 170/255.0, green: 5/255.0, blue: 0/255.0, alpha: 1.0)
            
            // Options View Colors
            public var sortByLabelColor = UIColor(red: 160/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
            public var colorSchemeLabelColor = UIColor(red: 0/255.0, green: 160/255.0, blue: 0/255.0, alpha: 1.0)
            public var dismissButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            
            // Details / Editor View Colors
            public var nameLabelColor = UIColor(red: 94/255.0, green: 10/255.0, blue: 0/255.0, alpha: 1.0)
            public var importanceLabelColor = UIColor(red: 65/255.0, green: 34/255.0, blue: 115/255.0, alpha: 1.0)
            public var createdDateLabelColor = UIColor(red: 135/255.0, green: 94/255.0, blue: 20/255.0, alpha: 1.0)
            public var dueDateLabelColor = UIColor(red: 94/255.0, green: 10/255.0, blue: 0/255.0, alpha: 1.0)
            public var detailsViewDueDateTextColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
            public var detailsLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            public var backButtonColor = UIColor(red: 170/255.0, green: 5/255.0, blue: 0/255.0, alpha: 1.0)
            public var editButtonColor = UIColor(red: 170/255.0, green: 5/255.0, blue: 0/255.0, alpha: 1.0)
            public var cancelButtonColor = UIColor(red: 170/255.0, green: 5/255.0, blue: 0/255.0, alpha: 1.0)
            public var saveButtonColor = UIColor(red: 170/255.0, green: 5/255.0, blue: 0/255.0, alpha: 1.0)
            public var dueDateHeaderLabelColor = UIColor(red: 94/255.0, green: 10/255.0, blue: 0/255.0, alpha: 1.0)
            public var editorViewDueDateTextColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
            public var changeButtonColor = UIColor(red: 135/255.0, green: 94/255.0, blue: 20/255.0, alpha: 1.0)
            
            // DueDatePicker View Colors
            public var dueDateSaveButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
        }
        
        public struct RedColorScheme: ColorSchemeProtocol {
            // Main Colors
            public var mainBackgroundColor = UIColor(red: 255/255.0, green: 180/255.0, blue: 180/255.0, alpha: 1.0)
            public var secondaryBackgroundColor = UIColor(red: 255/255.0, green: 225/255.0, blue: 225/255.0, alpha: 1.0)
            
            // Cell Colors
            public var cellBackgroundColor = UIColor(red: 230/255.0, green: 160/255.0, blue: 160/255.0, alpha: 1.0)
            public var subtitleDueDateOnCellColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            
            // ToDoList TableView Colors
            public var optionsButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 200/255.0, alpha: 1.0)
            public var newButtonColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 94/255.0, alpha: 1.0)
            
            // Options View Colors
            public var sortByLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 180/255.0, alpha: 1.0)
            public var colorSchemeLabelColor = UIColor(red: 110/255.0, green: 65/255.0, blue: 0/255.0, alpha: 1.0)
            public var dismissButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            
            // Details / Editor View Colors
            public var nameLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 200/255.0, alpha: 1.0)
            public var importanceLabelColor = UIColor(red: 65/255.0, green: 34/255.0, blue: 115/255.0, alpha: 1.0)
            public var createdDateLabelColor = UIColor(red: 10/255.0, green: 50/255.0, blue: 15/255.0, alpha: 1.0)
            public var dueDateLabelColor = UIColor(red: 0/255.0, green: 100/255.0, blue: 0/255.0, alpha: 1.0)
            public var detailsViewDueDateTextColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
            public var detailsLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            public var backButtonColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 92/255.0, alpha: 1.0)
            public var editButtonColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 92/255.0, alpha: 1.0)
            public var cancelButtonColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 92/255.0, alpha: 1.0)
            public var saveButtonColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 92/255.0, alpha: 1.0)
            public var dueDateHeaderLabelColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 92/255.0, alpha: 1.0)
            public var editorViewDueDateTextColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
            public var changeButtonColor = UIColor(red: 100/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
            
            // DueDatePicker View Colors
            public var dueDateSaveButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
        }
    }
}
