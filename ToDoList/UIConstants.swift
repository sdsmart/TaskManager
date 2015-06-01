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
        static let optionsViewControllerSize = CGSize(width: CGFloat(320.0), height: CGFloat(180.0))
    }
    
    public struct Animation {
        static let keyboardSlideAnimationDistanceOffset: CGFloat = 75
        static let keyboardSlideViewAnimationUpDuration = 0.28
        static let keyboardSlideViewAnimationDownDuration = 0.18
    }
    
    public struct Colors {
        public enum ColorScheme: String {
            case Default = "default_color_scheme"
            case Blue = "blue_color_scheme"
        }
        
        public struct DefaultColorScheme {
            // Main Colors
            static let mainBackgroundColor = UIColor(red: CGFloat(255/255.0), green: CGFloat(246/255.0), blue: CGFloat(150/255.0), alpha: CGFloat(1.0))
            static let secondaryBackgroundColor = UIColor(red: CGFloat(255/255.0), green: CGFloat(246/255.0), blue: CGFloat(200/255.0), alpha: CGFloat(1.0))
            
            // Cell Colors
            static let cellBackgroundColor = UIColor(red: CGFloat(255/255.0), green: CGFloat(246/255.0), blue: CGFloat(100/255.0), alpha: CGFloat(1.0))
             static let subtitleDueDateOnCellColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(15/255.0), blue: CGFloat(195/255.0), alpha: CGFloat(1.0))
            
            // ToDoList TableView Colors
            static let optionsButtonColor = UIColor(red: CGFloat(94/255.0), green: CGFloat(10/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            static let newButtonColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(230/255.0), alpha: CGFloat(1.0))
            
            // Options View Colors
            static let sortByLabelColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(255/255.0), alpha: CGFloat(1.0))
            static let colorSchemeLabelColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(100/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            static let dismissButtonColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(150/255.0), alpha: CGFloat(1.0))
            
            // Details / Editor View Colors
            static let nameLabelColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(230/255.0), alpha: CGFloat(1.0))
            static let importanceLabelColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(150/255.0), alpha: CGFloat(1.0))
            static let createdDateLabelColor = UIColor(red: CGFloat(45/255.0), green: CGFloat(50/255.0), blue: CGFloat(75/255.0), alpha: CGFloat(1.0))
            static let dueDateLabelColor = UIColor(red: CGFloat(94/255.0), green: CGFloat(10/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            static let dueDateTextColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(240/255.0), alpha: CGFloat(1.0))
            static let detailsLabelColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(150/255.0), alpha: CGFloat(1.0))
            static let backButtonColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(230/255.0), alpha: CGFloat(1.0))
            static let editButtonColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(230/255.0), alpha: CGFloat(1.0))
            static let cancelButtonColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(230/255.0), alpha: CGFloat(1.0))
            static let saveButtonColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(230/255.0), alpha: CGFloat(1.0))
        }
        
        public struct BlueColorScheme {
            static let mainBackgroundColor = UIColor(red: CGFloat(200/255.0), green: CGFloat(230/255.0), blue: CGFloat(255/255.0), alpha: CGFloat(1.0))
            static let secondaryBackgroundColor = UIColor(red: CGFloat(225/255.0), green: CGFloat(250/255.0), blue: CGFloat(255/255.0), alpha: CGFloat(1.0))
            
            // Cell Colors
            static let cellBackgroundColor = UIColor(red: CGFloat(140/255.0), green: CGFloat(220/255.0), blue: CGFloat(250/255.0), alpha: CGFloat(1.0))
            static let subtitleDueDateOnCellColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(150/255.0), alpha: CGFloat(1.0))
            
            // ToDoList TableView Colors
            static let optionsButtonColor = UIColor(red: CGFloat(190/255.0), green: CGFloat(135/255.0), blue: CGFloat(5/255.0), alpha: CGFloat(1.0))
            static let newButtonColor = UIColor(red: CGFloat(170/255.0), green: CGFloat(5/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            
            // Options View Colors
            static let sortByLabelColor = UIColor(red: CGFloat(160/255.0), green: CGFloat(0/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            static let colorSchemeLabelColor = UIColor(red: CGFloat(190/255.0), green: CGFloat(135/255.0), blue: CGFloat(5/255.0), alpha: CGFloat(1.0))
            static let dismissButtonColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(150/255.0), alpha: CGFloat(1.0))
            
            // Details / Editor View Colors
            static let nameLabelColor = UIColor(red: CGFloat(94/255.0), green: CGFloat(10/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            static let importanceLabelColor = UIColor(red: CGFloat(65/255.0), green: CGFloat(34/255.0), blue: CGFloat(115/255.0), alpha: CGFloat(1.0))
            static let createdDateLabelColor = UIColor(red: CGFloat(135/255.0), green: CGFloat(94/255.0), blue: CGFloat(20/255.0), alpha: CGFloat(1.0))
            static let dueDateLabelColor = UIColor(red: CGFloat(94/255.0), green: CGFloat(10/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            static let dueDateTextColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(130/255.0), alpha: CGFloat(1.0))
            static let detailsLabelColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(150/255.0), alpha: CGFloat(1.0))
            static let backButtonColor = UIColor(red: CGFloat(170/255.0), green: CGFloat(5/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            static let editButtonColor = UIColor(red: CGFloat(170/255.0), green: CGFloat(5/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            static let cancelButtonColor = UIColor(red: CGFloat(170/255.0), green: CGFloat(5/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
            static let saveButtonColor = UIColor(red: CGFloat(170/255.0), green: CGFloat(5/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
        }
        
        static let highImportanceColor = UIColor(red: CGFloat(210/255.0), green: CGFloat(0/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
        static let mediumImportanceColor = UIColor(red: CGFloat(220/255.0), green: CGFloat(80/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
        static let lowImportanceColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(196/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
    }
}