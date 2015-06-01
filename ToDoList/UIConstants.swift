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
        static let optionsViewControllerSize = CGSize(width: 320.0, height: 180.0)
    }
    
    public struct Animation {
        static let keyboardSlideAnimationDistanceOffset: CGFloat = 75
        static let keyboardSlideViewAnimationUpDuration = 0.28
        static let keyboardSlideViewAnimationDownDuration = 0.18
    }
    
    public struct Colors {
        public struct ColorScheme {
            static let defaultScheme = "DefaultColorScheme"
            static let blueScheme = "BlueColorScheme"
            static let redScheme = "RedColorScheme"
        }
        
        public struct DefaultColorScheme: ColorSchemeProtocol {
            // Main Colors
            public var mainBackgroundColor = UIColor(red: 255/255.0, green: 246/255.0, blue: 150/255.0, alpha: 1.0)
            public var secondaryBackgroundColor = UIColor(red: 255/255.0, green: 246/255.0, blue: 200/255.0, alpha: 1.0)
            
            // Cell Colors
            public var cellBackgroundColor = UIColor(red: 255/255.0, green: 246/255.0, blue: 100/255.0, alpha: 1.0)
            public var subtitleDueDateOnCellColor = UIColor(red: 0/255.0, green: 15/255.0, blue: 195/255.0, alpha: 1.0)
            
            // ToDoList TableView Colors
            public var optionsButtonColor = UIColor(red: 94/255.0, green: 10/255.0, blue: 0/255.0, alpha: 1.0)
            public var newButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
            
            // Options View Colors
            public var sortByLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 255/255.0, alpha: 1.0)
            public var colorSchemeLabelColor = UIColor(red: 0/255.0, green: 100/255.0, blue: 0/255.0, alpha: 1.0)
            public var dismissButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            
            // Details / Editor View Colors
            public var nameLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
            public var importanceLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            public var createdDateLabelColor = UIColor(red: 45/255.0, green: 50/255.0, blue: 75/255.0, alpha: 1.0)
            public var dueDateLabelColor = UIColor(red: 94/255.0, green: 10/255.0, blue: 0/255.0, alpha: 1.0)
            public var dueDateTextColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 240/255.0, alpha: 1.0)
            public var detailsLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            public var backButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
            public var editButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
            public var cancelButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
            public var saveButtonColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 230/255.0, alpha: 1.0)
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
            public var dueDateTextColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 225/255.0, alpha: 1.0)
            public var detailsLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            public var backButtonColor = UIColor(red: 170/255.0, green: 5/255.0, blue: 0/255.0, alpha: 1.0)
            public var editButtonColor = UIColor(red: 170/255.0, green: 5/255.0, blue: 0/255.0, alpha: 1.0)
            public var cancelButtonColor = UIColor(red: 170/255.0, green: 5/255.0, blue: 0/255.0, alpha: 1.0)
            public var saveButtonColor = UIColor(red: 170/255.0, green: 5/255.0, blue: 0/255.0, alpha: 1.0)
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
            public var dueDateLabelColor = UIColor(red: 94/255.0, green: 10/255.0, blue: 0/255.0, alpha: 1.0)
            public var dueDateTextColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 180/255.0, alpha: 1.0)
            public var detailsLabelColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 150/255.0, alpha: 1.0)
            public var backButtonColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 92/255.0, alpha: 1.0)
            public var editButtonColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 92/255.0, alpha: 1.0)
            public var cancelButtonColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 92/255.0, alpha: 1.0)
            public var saveButtonColor = UIColor(red: 70/255.0, green: 0/255.0, blue: 92/255.0, alpha: 1.0)
        }
        
        static let highImportanceColor = UIColor(red: 190/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        static let mediumImportanceColor = UIColor(red: 220/255.0, green: 80/255.0, blue: 0/255.0, alpha: 1.0)
        static let lowImportanceColor = UIColor(red: 0/255.0, green: 160/255.0, blue: 0/255.0, alpha: 1.0)
    }
}
